import logging
from flask import Flask, request, jsonify
from flask_mail import Mail, Message
from flask_pymongo import PyMongo
from pymongo import errors
from werkzeug.utils import secure_filename
from werkzeug.security import generate_password_hash, check_password_hash
from dotenv import load_dotenv
from flask_cors import CORS
import hashlib
import os
import uuid
import random
import string
import re
from pymongo import MongoClient
import gridfs

# Set up logging
logging.basicConfig(level=logging.INFO)

app = Flask(__name__)
CORS(app)

# Load the environment variables
load_dotenv()

# Configuring Flask application with environment variables
app.config.update(
    MAIL_SERVER=os.environ['MAIL_SERVER'],
    MAIL_PORT=os.environ['MAIL_PORT'],
    MAIL_USE_SSL=True,
    MAIL_USE_TLS = False,
    MAIL_USERNAME=os.environ['MAIL_USERNAME'],
    MAIL_PASSWORD=os.environ['MAIL_PASSWORD'],
    MONGO_URI=os.environ['MONGO_URI']
    
)



mail = Mail(app)
mongo = PyMongo(app)

mongo.db.users.create_index("username", unique=True)
mongo.db.users.create_index("email", unique=True)
mongo.db.users.create_index("mobile_number", unique=True)

@app.route('/')
def home():
    return "Hello, World!"

# Email validation function
def is_valid_email(email):
    email_regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
    return re.match(email_regex, email)

# Mobile number validation function
def is_valid_mobile(mobile):
    return mobile.isdigit()

# Generate verification code
def generate_verification_code():
    salt = os.urandom(16)
    hash_val = hashlib.pbkdf2_hmac('sha256', ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(8)).encode('utf-8'), salt, 100000)
    return hash_val.hex()

# Function to send the verification code to user's email
def send_verification_code(email, code):
    print("sent")
    try:
        msg = Message("Your Verification Code",
                      sender=app.config["MAIL_USERNAME"],
                      recipients=[email])
        msg.body = f"Your verification code is {code}"
        mail.send(msg)
        logging.info(f"Sent verification code to {email}")
    except Exception as e:
        logging.error(str(e))
        return False, 500
    return True, 200


# U-DISE code validation function
def is_valid_udise_code(udise_code):
    return udise_code.isdigit()

# Generate a random token
def generate_token():
    return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(40))

# Function to send the password reset token to user's email
def send_reset_token(email, token):
    try:
        msg = Message("Password Reset Request",
                      sender=app.config["MAIL_USERNAME"],
                      recipients=[email])
        msg.body = f"Your password reset token is {token}. Use this token to reset your password."
        mail.send(msg)
    except Exception as e:
        logging.error(str(e))
        return False, 500
    return True, 200

def validate_password(password):
    """
    Validates password based on the following conditions:
    - At least 8 characters long
    - Contains at least one digit
    - Contains at least one uppercase letter
    - Contains at least one special character
    """
    if len(password) < 8:
        return False
    if not re.search("[0-9]", password):
        return False
    if not re.search("[A-Z]", password):
        return False
    # Assuming special characters are !@#$%^&*()-_+=
    if not re.search("[!@#$%^&*()\-_+=]", password):
        return False
    return True


@app.route('/signup-step1', methods=['POST'])
def signup_step1():
    username = request.form.get('username')
    email = request.form.get('email')
    password = request.form.get('password')
    retype_password = request.form.get('retype_password')
    mobile_number = request.form.get('mobile_number')

    # Check password and retype_password are the same
    if password != retype_password:
        return jsonify({'message': 'Passwords do not match.'}), 400

    # Email validation
    if not is_valid_email(email):
        return jsonify({'message': 'Invalid email address.'}), 400

    # Mobile number validation
    if not is_valid_mobile(mobile_number):
        return jsonify({'message': 'Invalid mobile number. Only digits are allowed.'}), 400

    verification_code = ''.join(random.choice(string.digits) for _ in range(4))
    send_verification_code(email, verification_code)
    # Validate password before proceeding
    if not validate_password(password):
        raise HTTPException(description="Password does not meet requirements.",code=400)

    hashed_password = generate_password_hash(password)

    user = {
        '_id': str(uuid.uuid4()),
        'username': username,
        'email': email,
        'password': hashed_password,
        'mobile_number': mobile_number,
        'verification_code': verification_code,
        'is_verified': False,
        'details_filled': False
    }

    try:
       mongo.db.users.insert_one(user)
    except errors.DuplicateKeyError:
       return jsonify({'message': 'Username or Email already exists.'}), 400

    return jsonify({'message': 'Signup successful. Please verify your email.'})

@app.route('/verify-code', methods=['POST'])
def verify_email_code():
    email = request.form.get('email')
    verification_code = request.form.get('verification_code')

    if None in [email, verification_code]:
        return jsonify({'message': 'Missing verification information.'}), 400

    user = mongo.db.users.find_one({"email": email})

    if user:
        if user['verification_code'] == verification_code:
            mongo.db.users.update_one(
                {'_id': user['_id']},
                {'$set': {'is_verified': True, 'verification_code': None}}
            )
            return jsonify({'message': 'Verification successful. Please complete the signup process.'})
        else:
            return jsonify({'message': 'Invalid verification code.'}), 400
    else:
        return jsonify({'message': 'User not found.'}), 404

@app.route('/resend-verification-code', methods=['POST'])
def resend_verification_code():
    email = request.form.get('email')

    if not email or not is_valid_email(email):
        return jsonify({'message': 'Invalid email address.'}), 400

    user = mongo.db.users.find_one({"email": email})

    if not user:
        return jsonify({'message': 'Email does not exist.'}), 400

    if user['is_verified']:
        return jsonify({'message': 'Your email is already verified.'}), 400

    # Generate a new verification code
    new_verification_code = ''.join(random.choice(string.digits) for _ in range(4))

    # Update the user's verification code in the database
    mongo.db.users.update_one({'_id': user['_id']}, {'$set': {'verification_code': new_verification_code}})

    # Send the new verification code to the user's email
    success, status_code = send_verification_code(email, new_verification_code)
    if success:
        return jsonify({'message': 'Verification code has been resent to your email.'})
    else:
        return jsonify({'message': 'Failed to send the verification code. Please try again later.'}), status_code


@app.route('/signup-step2', methods=['POST'])
def signup_step2():
    email = request.form.get('email')
    institute_name = request.form.get('institute_name')
    address = request.form.get('address')
    udise_code = request.form.get('udise_code')
    document = request.files.get('document')

    # Document format validation
    if document.content_type not in ['application/pdf', 'image/png', 'image/jpeg','image/jpg']:
        print("invalid format",document.content_type);
        return jsonify({'message': 'Invalid document format. Only PDF, PNG, and JPEG files are accepted.'}), 400

    secure_doc_name = secure_filename(document.filename)

    # Saving the document directly to GridFS (MongoDB)
    file_id = fs.put(document, filename=secure_doc_name, content_type=document.content_type)

    # Assuming you'll use the email to find the user and update details.
    user = mongo.db.users.find_one({"email": email})

    if user and user['is_verified']:
        mongo.db.users.update_one(
            {'_id': user['_id']},
            {'$set': {
                'institute_name': institute_name,
                'address': address,
                'udise_code': udise_code,
                'document_id': file_id,   # Storing the GridFS file id in the user document
                'details_filled': True
            }}
        )
        return jsonify({'message': 'Signup process completed. Please login to your account.'})
    else:
        return jsonify({'message': 'User not found or email not verified.'}), 404

# Retrieve all unverified documents
@app.route('/get-unverified-documents', methods=['GET'])
def get_unverified_documents():
    unverified_users = mongo.db.users.find({"is_verified": False})
    return jsonify([{'username': user['username'], 'document_path': user['document_path']} for user in unverified_users])

# Verify user document
@app.route('/verify-document', methods=['POST'])
def verify_document():
    username = request.form.get('username')

    if not username:
        return jsonify({'message': 'Missing username.', 'code': 400}), 400

    try:
        user = mongo.db.users.find_one({"username": username})
    except Exception as e:
        print(str(e))
        return jsonify({'message': 'Database error.'}), 500
    if user:
        verification_code = generate_verification_code()
        send_verification_code(user['email'], verification_code)

        mongo.db.users.update_one(
            {'_id': user['_id']},
            {'$set':
                 {'is_verified': True, 'verification_code': verification_code}
             }
        )

        return jsonify({'message': 'Document verified. Verification code sent to the user.'})
    else:
        return jsonify({'message': 'User not found.'}), 404

# Verify the verification code sent to user
@app.route('/verify-code', methods=['POST'])
def verify_document_code():
    username = request.form.get('username')
    verification_code = request.form.get('verification_code')

    if None in [username, verification_code]:
        return jsonify({'message': 'Missing verification information.'}), 400

    user = mongo.db.users.find_one({"username": username})

    if user:
        if user['verification_code'] == verification_code:
            mongo.db.users.update_one(
                {'_id': user['_id']},
                {'$set': {'is_verified': True, 'verification_code': None}}
            )
            return jsonify({'message': 'Verification successful. You can now access the dashboard.'})
        else:
            return jsonify({'message': 'Invalid verification code.'}), 400
    else:
        return jsonify({'message': 'User not found.'}), 404

# User login route
@app.route('/login', methods=['POST'])
def login():
    email = request.form.get('email')
    password = request.form.get('password')

    if None in [email, password]:
        return jsonify({'message': 'Missing login information.'}), 400
    
    

    user = mongo.db.users.find_one({"email": email})  # Query user by email

    if user and check_password_hash(user['password'], password):
        if user['is_verified']:
            return jsonify({'message': 'Login successful. You can access the dashboard now.', 'user_id': user['_id']})
        else:
            return jsonify({'message': 'Please verify your document to access the dashboard.'}), 403
    else:
        return jsonify({'message': 'Invalid email or password.'}), 401
    


@app.route('/forgot-password', methods=['POST'])
def forgot_password():
    email = request.form.get('email')

    if not email or not is_valid_email(email):
        return jsonify({'message': 'Invalid email address.'}), 400

    user = mongo.db.users.find_one({"email": email})
    if not user:
        return jsonify({'message': 'Email does not exist.'}), 400

    reset_token = generate_token()
    mongo.db.users.update_one({'_id': user['_id']}, {'$set': {'reset_token': reset_token}})

    send_reset_token(email, reset_token)

    return jsonify({'message': 'Password reset token has been sent to your email.'})

@app.route('/reset-password', methods=['POST'])
def reset_password():
    email = request.form.get('email')
    reset_token = request.form.get('reset_token')
    new_password = request.form.get('new_password')

    user = mongo.db.users.find_one({"email": email})
    if not user:
        return jsonify({'message': 'Email does not exist.'}), 400

    if not user.get('reset_token') or user.get('reset_token') != reset_token:
        return jsonify({'message': 'Invalid reset token.'}), 400

    hashed_password = generate_password_hash(new_password)
    mongo.db.users.update_one({'_id': user['_id']}, {'$set': {'password': hashed_password, 'reset_token': None}})

    return jsonify({'message': 'Password has been reset successfully.'})

# Dashboard route
@app.route('/dashboard', methods=['GET'])
def dashboard():
    user_id = request.args.get('user_id')

    if not user_id:
        return jsonify({'message': 'Missing user ID.'}), 400

    user = mongo.db.users.find_one({"_id": user_id})

    if user and user['is_verified']:
        return jsonify({'message': 'Welcome to the dashboard!'})
    else:
        return jsonify({'message': 'Invalid user ID or user not verified.'}), 401

if __name__ == '__main__':
    app.run(debug=True,port=6000,host='0.0.0.0')
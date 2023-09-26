import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:schoolpenintern/Screens/management/screens/login_page.dart';

import '../screens/dashboard.dart';
import '../screens/sign_up_step2.dart';
import '../screens/verify_email.dart';
import '../screens/welcome_screen.dart';
import 'package:path/path.dart';


class HttpService {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse('http://192.168.231.69:6000/login');

  static var _verifyUrl = Uri.parse('http://192.168.231.69:6000/verify-code');
  static var _signUpStep1Url = Uri.parse('http://192.168.231.69:6000/signup-step1');
   static var _signUpStep2Url = Uri.parse('http://192.168.231.69:6000/signup-step2');
  static var _verifyDocument = Uri.parse('http://192.168.231.69:6000/verify-document');
  static var _forgetPassword = Uri.parse('http://192.168.231.69:6000/forgot-password');
  static var _resetPassword = Uri.parse('http://192.168.231.69:6000//reset-password');
  static var _resendVerificationCode = Uri.parse('http://192.168.231.69:6000/resend-verification-code');
  

  static signupStep1(username,email,password,retypePassword,mobileNumber, context) async {
    var map =  <String, String>{};
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    map['retype_password'] = retypePassword;
    map['mobile_number'] = mobileNumber;
    http.Response response = await _client.post(_signUpStep1Url, body: map);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (response.statusCode != 400) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => VerifyEmail(email: email)));
      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
  static verifyCode(email, context) async {
    var map =  <String, String>{};
    map['email'] = email;
    http.Response response = await _client.post(_verifyUrl, body: map);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (json['status'] == 'Verification successful. Please complete the signup process.') {
       EasyLoading.showSuccess(json['message']);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SignUpStep2Screen()));
      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }

  static login(email, pass, context) async {
    var map =  <String, String>{};
    map['email'] = email;
    map['password'] = pass;
    http.Response response = await _client.post(_loginUrl, body: map);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      
      if (response.statusCode == 400) {
        await EasyLoading.showError(json['message']);
      } else {
        await EasyLoading.showSuccess(json['message']);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()));
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
  static signupStep2(email,instituteName ,address,udiseCode,document, context) async {
    http.MultipartRequest request = await http.MultipartRequest('POST',_signUpStep2Url);
    request.fields['email'] = email;
    request.fields['institute_name'] = instituteName;
    request.fields['address'] = address;
    request.fields['udise_code'] = udiseCode;
    request.files.add(http.MultipartFile('document', File(document!.path!).readAsBytes().asStream(), File(document!.path!).lengthSync(), filename: basename(document!.path!)));
    var response = await request.send();
    if (response.statusCode == 200) {
      
      

      if (response.statusCode != 400) {
        
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AuthScreen()));
      } else {
        EasyLoading.showError(
            "Error Code : ${response.statusCode.toString()}");
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
  static verifyDocument(username, context) async {
    var map =  <String, String>{};
    map['username'] = username;

    http.Response response = await _client.post(_signUpStep2Url, body:map);
    var json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (response.statusCode != 400) {
        await EasyLoading.showSuccess(json['message']);
      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
  static verifyEmailCode(email,verificationCode, context) async {
    var map =  <String, String>{};
    map['email'] = email;
    map['verification_code'] = verificationCode;
    

    http.Response response = await _client.post(_verifyUrl, body:map);
    var json = jsonDecode(response.body);


    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (response.statusCode != 400) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SignUpStep2Screen()));

      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
  static forgotPassword(email, context) async {
    var map =  <String, String>{};
    map['email'] = email;
    http.Response response = await _client.post(_forgetPassword, body:map);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (response.statusCode != 400) {
        await EasyLoading.showSuccess(json['message']);
      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
  static resetPassword(email,resetToken,newPassword, context) async {
    var map =  <String, String>{};
    map['email'] = email;
    map['reset_token'] = resetToken;
    map['new_password'] = newPassword;
    http.Response response = await _client.post(_resetPassword, body:map);
    var json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (response.statusCode != 400) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
  static verifyDocCode(username,verificationCode, context) async {
    var map =  <String, String>{};
    map['username'] = username;
    map['verification_code'] = verificationCode;

    http.Response response = await _client.post(_verifyUrl, body:map);
    var json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (response.statusCode != 400) {
        await EasyLoading.showSuccess(json['message']);

      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
  static resendVerificationCode(email, context) async {
    var map =  <String, String>{};
    map['email'] = email;
  

    http.Response response = await _client.post(_resendVerificationCode, body:map);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      

      if (response.statusCode != 400) {
        await EasyLoading.showSuccess(json['message']);

      } else {
        EasyLoading.showError(json['message']);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${json['message']}");
    }
  }
}

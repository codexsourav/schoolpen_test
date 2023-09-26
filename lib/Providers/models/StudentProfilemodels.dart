class StudentProfileModel {
  String? sId;
  String? userId;
  String? password;
  String? username;
  String? role;
  String? userClass;
  String? schoolkey;
  String? gender;
  String? dob;
  String? userImage;
  String? statusTitle;
  String? statusDescription;
  PersonalInfo? personalInfo;

  StudentProfileModel(
      {this.sId,
      this.userId,
      this.password,
      this.username,
      this.role,
      this.userClass,
      this.schoolkey,
      this.gender,
      this.dob,
      this.userImage,
      this.statusTitle,
      this.statusDescription,
      this.personalInfo});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    password = json['password'];
    username = json['username'];
    role = json['role'];
    userClass = json['user_class'];
    schoolkey = json['schoolkey'];
    gender = json['gender'];
    dob = json['dob'];
    userImage = json['user_image'];
    statusTitle = json['status_title'];
    statusDescription = json['status_description'];
    personalInfo = json['personal_info'] != null
        ? new PersonalInfo.fromJson(json['personal_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['password'] = this.password;
    data['username'] = this.username;
    data['role'] = this.role;
    data['user_class'] = this.userClass;
    data['schoolkey'] = this.schoolkey;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['user_image'] = this.userImage;
    data['status_title'] = this.statusTitle;
    data['status_description'] = this.statusDescription;
    if (this.personalInfo != null) {
      data['personal_info'] = this.personalInfo!.toJson();
    }
    return data;
  }
}

class PersonalInfo {
  String? about;
  Contact? contact;

  PersonalInfo({this.about, this.contact});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    return data;
  }
}

class Contact {
  String? phone;
  String? email;
  Address? address;

  Contact({this.phone, this.email, this.address});

  Contact.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? pincode;

  Address({this.street, this.city, this.state, this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}

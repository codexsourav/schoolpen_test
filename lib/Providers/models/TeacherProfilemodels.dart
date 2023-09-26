class TeacherProfileModel {
  String? sId;
  String? username;
  String? languages;
  String? userImage;
  String? role;
  Profile? profile;

  TeacherProfileModel(
      {this.sId,
      this.username,
      this.languages,
      this.userImage,
      this.role,
      this.profile});

  TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    languages = json['languages'];
    userImage = json['user_image'];
    role = json['role'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['languages'] = this.languages;
    data['user_image'] = this.userImage;
    data['role'] = this.role;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  Status? status;
  String? about;
  UseridnamePassword? useridnamePassword;
  Contact? contact;

  Profile({this.status, this.about, this.useridnamePassword, this.contact});

  Profile.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    about = json['about'];
    useridnamePassword = json['useridname_password'] != null
        ? new UseridnamePassword.fromJson(json['useridname_password'])
        : null;
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['about'] = this.about;
    if (this.useridnamePassword != null) {
      data['useridname_password'] = this.useridnamePassword!.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    return data;
  }
}

class Status {
  String? userDesignation;
  String? userDescription;

  Status({this.userDesignation, this.userDescription});

  Status.fromJson(Map<String, dynamic> json) {
    userDesignation = json['user_designation'];
    userDescription = json['user_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_designation'] = this.userDesignation;
    data['user_description'] = this.userDescription;
    return data;
  }
}

class UseridnamePassword {
  String? useridName;
  String? password;

  UseridnamePassword({this.useridName, this.password});

  UseridnamePassword.fromJson(Map<String, dynamic> json) {
    useridName = json['userid_name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid_name'] = this.useridName;
    data['password'] = this.password;
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
  String? houseNo;
  String? street;
  String? postalCode;
  String? city;
  String? state;

  Address({this.houseNo, this.street, this.postalCode, this.city, this.state});

  Address.fromJson(Map<String, dynamic> json) {
    houseNo = json['house_no'];
    street = json['street'];
    postalCode = json['postal_code'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['house_no'] = this.houseNo;
    data['street'] = this.street;
    data['postal_code'] = this.postalCode;
    data['city'] = this.city;
    data['state'] = this.state;
    return data;
  }
}

class ParentProfileModel {
  String? sId;
  String? parentUseridname;
  String? parentName;
  String? parentAge;
  String? role;
  String? parentGender;
  String? parentImage;
  PersonalInfo? personalInfo;

  ParentProfileModel(
      {this.sId,
      this.parentUseridname,
      this.parentName,
      this.parentAge,
      this.role,
      this.parentGender,
      this.parentImage,
      this.personalInfo});

  ParentProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    parentUseridname = json['parent_useridname'];
    parentName = json['parent_name'];
    parentAge = json['parent_age'];
    role = json['role'];
    parentGender = json['parent_gender'];
    parentImage = json['parent_image'];
    personalInfo = json['personal_info'] != null
        ? new PersonalInfo.fromJson(json['personal_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['parent_useridname'] = this.parentUseridname;
    data['parent_name'] = this.parentName;
    data['parent_age'] = this.parentAge;
    data['role'] = this.role;
    data['parent_gender'] = this.parentGender;
    data['parent_image'] = this.parentImage;
    if (this.personalInfo != null) {
      data['personal_info'] = this.personalInfo!.toJson();
    }
    return data;
  }
}

class PersonalInfo {
  String? parentAbout;
  Contact? contact;

  PersonalInfo({this.parentAbout, this.contact});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    parentAbout = json['parent_about'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_about'] = this.parentAbout;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    return data;
  }
}

class Contact {
  String? parentPhone;
  String? parentEmail;
  ParentAddress? parentAddress;

  Contact({this.parentPhone, this.parentEmail, this.parentAddress});

  Contact.fromJson(Map<String, dynamic> json) {
    parentPhone = json['parent_phone'];
    parentEmail = json['parent_email'];
    parentAddress = json['parent_address'] != null
        ? new ParentAddress.fromJson(json['parent_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_phone'] = this.parentPhone;
    data['parent_email'] = this.parentEmail;
    if (this.parentAddress != null) {
      data['parent_address'] = this.parentAddress!.toJson();
    }
    return data;
  }
}

class ParentAddress {
  String? parentCountry;
  String? parentState;
  String? parentCity;
  String? parentStreetAddress;
  String? parentPostalCode;

  ParentAddress(
      {this.parentCountry,
      this.parentState,
      this.parentCity,
      this.parentStreetAddress,
      this.parentPostalCode});

  ParentAddress.fromJson(Map<String, dynamic> json) {
    parentCountry = json['parent_country'];
    parentState = json['parent_state'];
    parentCity = json['parent_city'];
    parentStreetAddress = json['parent_StreetAddress'];
    parentPostalCode = json['parent_PostalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_country'] = this.parentCountry;
    data['parent_state'] = this.parentState;
    data['parent_city'] = this.parentCity;
    data['parent_StreetAddress'] = this.parentStreetAddress;
    data['parent_PostalCode'] = this.parentPostalCode;
    return data;
  }
}

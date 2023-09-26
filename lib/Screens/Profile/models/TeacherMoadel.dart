class TeacherData {
  String? email;
  String? gender;
  String? languages;
  Status? status;
  String? userImage;
  String? useridName;
  String? username;

  TeacherData(
      {this.email,
      this.gender,
      this.languages,
      this.status,
      this.userImage,
      this.useridName,
      this.username});

  TeacherData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    gender = json['gender'];
    languages = json['languages'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    userImage = json['user_image'];
    useridName = json['userid_name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['languages'] = this.languages;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['user_image'] = this.userImage;
    data['userid_name'] = this.useridName;
    data['username'] = this.username;
    return data;
  }
}

class Status {
  String? userDescription;
  String? userDesignation;

  Status({this.userDescription, this.userDesignation});

  Status.fromJson(Map<String, dynamic> json) {
    userDescription = json['user_description'];
    userDesignation = json['user_designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_description'] = this.userDescription;
    data['user_designation'] = this.userDesignation;
    return data;
  }
}

class signupModel {
  String? sId;
  String? message;
  String? role;
  bool? success;
  String? userId;

  signupModel({this.sId, this.message, this.role, this.success, this.userId});

  signupModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    message = json['message'];
    role = json['role'];
    success = json['success'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['message'] = this.message;
    data['role'] = this.role;
    data['success'] = this.success;
    data['user_id'] = this.userId;
    return data;
  }
}
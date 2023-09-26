// PLease NO MOdify By Hand This Code IS Auto Genarated

class UserSearchMoadel {
  String? sId;
  String? role;
  String? userId;
  String? userImage;
  String? username;

  UserSearchMoadel(
      {this.sId, this.role, this.userId, this.userImage, this.username});

  UserSearchMoadel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    userId = json['user_id'];
    userImage = json['user_image'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['role'] = this.role;
    data['user_id'] = this.userId;
    data['user_image'] = this.userImage;
    data['username'] = this.username;
    return data;
  }
}

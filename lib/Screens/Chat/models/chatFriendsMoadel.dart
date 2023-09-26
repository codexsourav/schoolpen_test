class FriendRequestMoadel {
  String? recipient;
  String? sender;
  String? status;

  FriendRequestMoadel({this.recipient, this.sender, this.status});

  FriendRequestMoadel.fromJson(Map<String, dynamic> json) {
    recipient = json['recipient'];
    sender = json['sender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipient'] = this.recipient;
    data['sender'] = this.sender;
    data['status'] = this.status;
    return data;
  }
}

class Message {
  String? key;
  late String uid;
  late String message;
  late String roomId;
  late int createdAt;
  bool check = false;
  String? imgURL;

  setKey(String key) {
    this.key = key;
  }

  checkMessage() {
    check = true;
  }

  Message(Map<String, dynamic> data) {
    uid = data["uid"];
    message = data["message"];
    roomId = data["roomId"];
    createdAt = DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = key ?? "";
    data['uid'] = uid;
    data['message'] = message;
    data['roomId'] = roomId;
    data['createdAt'] = createdAt;
    data['check'] = check;
    data['imgURL'] = imgURL ?? "";
    return data;
  }
}

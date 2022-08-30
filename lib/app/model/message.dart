class Message {
  late String key;
  late String uid;
  late String message;
  late String roomKey;
  late int createdAt;
  bool check = false;
  String? imgURL;

  checkMessage() {
    check = true;
  }

  Message(Map<String, dynamic> data) {
    key = data["key"];
    uid = data["uid"];
    message = data["message"];
    roomKey = data["roomKey"];
    check = false;
    createdAt = DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = key ?? "";
    data['uid'] = uid;
    data['message'] = message;
    data['roomId'] = roomKey;
    data['createdAt'] = createdAt;
    data['check'] = check;
    data['imgURL'] = imgURL ?? "";
    return data;
  }
}

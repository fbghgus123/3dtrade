class ChatUser {
  late String productKey;
  late String roomKey;
  late String uid;

  ChatUser(Map<String, dynamic> data) {
    productKey = data["productKey"];
    roomKey = data["roomKey"];
    uid = data["uid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productKey'] = productKey;
    data['roomKey'] = roomKey;
    data['uid'] = uid;
    return data;
  }
}

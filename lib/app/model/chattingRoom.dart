class ChattingRoom {
  late String key;
  late String productKey;
  late String sellerUid;
  late int createdAt;

  ChattingRoom(Map<String, dynamic> data) {
    key = data["key"];
    productKey = data["productKey"];
    sellerUid = data["sellerUid"];
    createdAt = DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["key"] = key;
    data["productKey"] = productKey;
    data["sellerUid"] = sellerUid;
    data["createdAt"] = createdAt;
    return data;
  }
}

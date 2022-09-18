class Keyword {
  String? uid;
  String? keyword;
  int? createdAt;

  Keyword(Map<String, dynamic> data) {
    uid = data["uid"];
    keyword = data["keyword"];
    createdAt = DateTime.now().millisecondsSinceEpoch;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["uid"] = uid;
    data["keyword"] = keyword;
    data["createdAt"] = createdAt;
    return data;
  }
}

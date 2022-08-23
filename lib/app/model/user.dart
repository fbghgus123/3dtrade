class UserData {
  late String uid;
  late String displayName;
  late String imgURL;
  String? email;
  int? phone;

  UserData(Map<String, dynamic> data) {
    uid = data["uid"];
    displayName = data["displayName"];
    imgURL = data["photoURL"] ?? "";
    email = null;
    phone = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["uid"] = uid;
    data["displayName"] = displayName;
    data["imgURL"] = imgURL;
    data["email"] = "null";
    data["phone"] = "null";
    return data;
  }

  UserData empty() {
    return UserData({"uid": "null", "displayName": "null", "imgURL": "null"});
  }
}

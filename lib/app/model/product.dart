class ProductData {
  String? key;
  List<dynamic>? images;
  String? title;
  String? category;
  String? content;
  int? price;
  String? seller;
  String? date;

  // ProductData(
  //     {this.images,
  //     this.title,
  //     this.category,
  //     this.content,
  //     this.price,
  //     this.seller,
  //     this.date});

  setKey(String key) {
    this.key = key;
  }

  ProductData(Map<String, dynamic> data) {
    images = data["images"];
    key = data["key"] ?? "";
    title = data["title"];
    category = data["category"];
    content = data["content"];
    price = data["price"];
    seller = data["seller"];
    date = data["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = key ?? "";
    data['images'] = images;
    data['title'] = title;
    data['category'] = category;
    data['content'] = content;
    data['price'] = price;
    data['seller'] = seller;
    data['date'] = date;
    return data;
  }
}

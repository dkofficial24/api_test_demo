class AddProductRequest {
  String name;
  String desc;
  int price;

  AddProductRequest({
    required this.name,
    required this.desc,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': desc,
      'price': price,
    };
  }
}

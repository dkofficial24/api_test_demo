class UpdateProductRequest {
  String name;
  String desc;
  int price;

  UpdateProductRequest({
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

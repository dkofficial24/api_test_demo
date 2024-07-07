class ProductModel{
  String id;
  String name;
  String desc;
  int price;

  ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price
});


  static ProductModel fromMap(Map<String,dynamic> map){
    ProductModel productModel =  ProductModel(
      id: map['_id'],
      name:map['name'],
      desc: map['description'],
      price: map['price']
    );
    return productModel;
  }
}
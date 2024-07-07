class DeleteProductResponse {
  String? message;

  DeleteProductResponse({this.message});

  DeleteProductResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

import 'dart:convert';

import 'package:api_test_demo/add_product_request_model.dart';
import 'package:api_test_demo/api_endpoint.dart';
import 'package:api_test_demo/delete_product_response_model.dart';
import 'package:api_test_demo/fetch_user_response_model.dart';
import 'package:api_test_demo/product_model.dart';
import 'package:api_test_demo/update_product_request.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductApiService {
  static Future<ProductModel> fetchProduct(String productId) async {
    String url = '${ApiEndpoints.product}/$productId';
    Uri uri = Uri.parse(url);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      ProductModel productModel = ProductModel.fromMap(json);
      return productModel;
    } else {
      throw 'Something went wrong';
    }
  }

  static Future<List<ProductModel>> fetchProducts() async {
    Uri uri = Uri.parse(ApiEndpoints.product);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String body = response.body;
      List<Map<String, dynamic>> listMap = jsonDecode(body);
      List<ProductModel> productList = [];
      for (int i = 0; i < listMap.length; i++) {
        ProductModel productModel = ProductModel.fromMap(listMap[i]);
        productList.add(productModel);
      }

      return productList;
    } else {
      throw 'Something went wrong';
    }
  }

  static Future<String> addProduct(AddProductRequest addProductRequest) async {
    Uri uri = Uri.parse(ApiEndpoints.product);
    Map<String, dynamic> map = addProductRequest.toMap();
    String mapStr = jsonEncode(map);
    Response response = await http.post(uri, body: mapStr);
    if (response.statusCode == 201) {
      return 'Product added successfully';
    } else {
      throw 'Something went wrong';
    }
  }

  static Future<String> updateProduct(
      String productId, UpdateProductRequest updateProductRequest) async {
    Map<String, dynamic> map = updateProductRequest.toMap();
    String mapStr = jsonEncode(map);
    Uri uri = Uri.parse('${ApiEndpoints.product}/$productId');
    Response response = await http.put(uri, body: mapStr);
    if (response.statusCode == 200) {
      return 'Product updated successfully';
    } else {
      throw 'Something went wrong';
    }
  }

  static Future<DeleteProductResponse> deleteProduct(String productId) async {
    String url = '${ApiEndpoints.product}/$productId';
    Uri uri = Uri.parse(url);
    Response response = await http.delete(uri);
    String body = response.body;
    var json = jsonDecode(body);
    DeleteProductResponse deleteProductResponse =
        DeleteProductResponse.fromJson(json);
    return deleteProductResponse;
  }
}

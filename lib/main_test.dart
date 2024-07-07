import 'package:api_test_demo/add_product_request_model.dart';
import 'package:api_test_demo/delete_product_response_model.dart';
import 'package:api_test_demo/product_api_service.dart';
import 'package:api_test_demo/product_model.dart';
import 'package:api_test_demo/update_product_request.dart';

void main() {
  fetchProduct();
  fetchProducts();
  addProduct();
}

bool isLoading = false;

Future deleteProduct() async {
  String productId = '';
  DeleteProductResponse deleteProductResponse =
      await ProductApiService.deleteProduct(productId);
  print(deleteProductResponse.message);
}

Future fetchProduct() async {
  try {
    String productId = '6630881bd4d335eabd6c9e72';
    isLoading = true;
    ProductModel productModel = await ProductApiService.fetchProduct(productId);

    print(productModel.id);
    print(productModel.name);
    print(productModel.desc);
    print(productModel.price);
  } catch (e) {
    print(e.toString());
  } finally {
    isLoading = false;
  }
}

Future fetchProducts() async {
  try {
    isLoading = true;
    List<ProductModel> productList = await ProductApiService.fetchProducts();

    for (int i = 0; i < productList.length; i++) {
      print(productList[i].id);
      print(productList[i].name);
      print(productList[i].desc);
      print(productList[i].price);
    }
  } catch (e) {
    print(e.toString());
  } finally {
    isLoading = false;
  }
}

Future addProduct() async {
  try {
    String name = 'iPhone';
    String desc = 'abfbasb jkabfkjab jasfbasf';
    int price = 45000;
    AddProductRequest addProductRequest = AddProductRequest(
      name: name,
      desc: desc,
      price: price,
    );

    String msg = await ProductApiService.addProduct(addProductRequest);
    print(msg);
  } catch (e) {
    print(e.toString());
  }
}

Future updateProduct() async {
  try {
    String name = 'iPhone';
    String desc = 'abfbasb jkabfkjab jasfbasf';
    int price = 45000;
    String id = 'aklfnalksnflknfknqqw';
    UpdateProductRequest updateProductRequest = UpdateProductRequest(
      name: name,
      desc: desc,
      price: price,
    );

    String msg =
        await ProductApiService.updateProduct(id, updateProductRequest);
    print(msg);
  } catch (e) {
    print(e.toString());
  }
}

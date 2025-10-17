import 'package:first_app/shop/data/product_model.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> cart = [];
  List<ProductModel> products = [];
  fetchData() async {
    // var fetchedData = await ProductRepositriy.fetchData();
    // products = fetchedData;
    notifyListeners();
  }

  addProduct(ProductModel productModel) {
    cart.add(productModel);
    notifyListeners();
  }

  removeProduct(ProductModel productModel) {
    cart.remove(productModel);
    notifyListeners();
  }

  cleanProduct() {
    cart.clear();
    notifyListeners();
  }

  bool isInCart(ProductModel productModel) {
    for (var element in cart) {
      if (element.id == productModel.id) {
        return true;
      }
    }
    return false;
  }
}

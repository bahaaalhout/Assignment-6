import 'package:first_app/shop/data/product_model.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];

  addProduct(ProductModel productModel) {
    products.add(productModel);
    notifyListeners();
  }

  removeProduct(ProductModel productModel) {
    products.remove(productModel);
    notifyListeners();
  }

  cleanProduct() {
    products.clear();
    notifyListeners();
  }

  bool isInCart(ProductModel productModel) {
    for (var element in products) {
      if (element.id == productModel.id) {
        return true;
      }
    }
    return false;
  }
}

import 'dart:convert';

import 'package:first_app/shop/data/product_model.dart';
import 'package:http/http.dart';

class ProductRepositriy {
  static Future<List<ProductModel>> fetchData() async {
    Response data = await get(Uri.parse('https://fakestoreapi.com/products'));
    // print(data.body);
    var respone = jsonDecode(data.body);
    List<ProductModel> products = [];
    for (Map map in respone) {
      ProductModel model = ProductModel.fromjson(map);
      products.add(model);
    }
    return products;
  }
}

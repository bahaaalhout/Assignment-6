import 'package:first_app/data/product_model.dart';
import 'package:first_app/screens/product/product_details.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetails(model: product)),
      ),

      leading: Image.network(product.image, width: 80, fit: BoxFit.cover),
      title: Text(product.title, overflow: TextOverflow.fade),
      subtitle: Text(product.description, overflow: TextOverflow.ellipsis),
    );
  }
}

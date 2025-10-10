import 'package:first_app/shop/data/product_model.dart';
import 'package:first_app/shop/presentation/provider/product_provider.dart';
import 'package:first_app/shop/presentation/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.product,
    required this.onPressed,
    this.isUsedCart = false,
  });
  final ProductModel product;
  final void Function()? onPressed;
  final bool isUsedCart;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetails(model: product)),
      ),
      leading: Image.network(product.image, width: 80, fit: BoxFit.cover),
      title: Text(product.title, overflow: TextOverflow.fade),
      subtitle: Text(product.description, overflow: TextOverflow.ellipsis),
      trailing: TextButton(
        onPressed: onPressed,
        child: provider.isInCart(product)
            ? isUsedCart
                  ? Icon(Icons.delete)
                  : Icon(Icons.check)
            : Icon(Icons.shopping_cart),
      ),
    );
  }
}

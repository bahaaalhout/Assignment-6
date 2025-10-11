import 'package:first_app/shop/presentation/provider/product_provider.dart';
import 'package:first_app/shop/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        actions: [
          Badge.count(
            count: provider.cart.length,
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ProductList(
            product: provider.products[index],
            onPressed: () {
              if (provider.cart.contains(provider.products[index])) return;
              provider.addProduct(provider.products[index]);
            },
          );
        },
        itemCount: provider.products.length,
      ),
    );
  }
}

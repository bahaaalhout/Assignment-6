import 'package:first_app/shop/presentation/provider/product_provider.dart';
import 'package:first_app/shop/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<ProductProvider>(
                context,
                listen: false,
              ).cleanProduct();
            },
            child: Icon(Icons.cancel_presentation_sharp),
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemBuilder: (context, index) => ProductList(
            product: provider.cart[index],
            onPressed: () {
              provider.removeProduct(provider.cart[index]);
            },
            isUsedCart: true,
          ),
          itemCount: provider.cart.length,
        ),
      ),
    );
  }
}

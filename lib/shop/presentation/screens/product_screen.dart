import 'dart:convert';

import 'package:first_app/shop/data/product_model.dart';
import 'package:first_app/shop/presentation/provider/product_provider.dart';
import 'package:first_app/shop/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

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
            count: provider.products.length,
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ProductList(
            product: products[index],
            onPressed: () {
              if (provider.products.contains(products[index])) return;
              provider.addProduct(products[index]);
            },
          );
        },
        itemCount: products.length,
      ),
    );
  }

  fetchData() async {
    Response data = await get(Uri.parse('https://fakestoreapi.com/products'));
    // print(data.body);
    var respone = jsonDecode(data.body);
    for (Map map in respone) {
      ProductModel model = ProductModel.fromjson(map);
      products.add(model);
    }
    setState(() {});
  }
}

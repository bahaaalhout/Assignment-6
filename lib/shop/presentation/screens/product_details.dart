import 'package:first_app/shop/data/product_model.dart';
import 'package:first_app/widgets/rate_section.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
        backgroundColor: Color(0xff1D1F24),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Hero(
                  tag: model,
                  child: Image.network(model.image, fit: BoxFit.fill),
                ),
              ),

              Text(
                model.description,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                model.category,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              RateSection(rate: model.rate),
            ],
          ),
        ),
      ),
    );
  }
}

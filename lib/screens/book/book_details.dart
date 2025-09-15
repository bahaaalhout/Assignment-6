import 'package:first_app/data/book_model.dart';
import 'package:first_app/widgets/rate_section.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.model});
  final BookModel model;

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
                  child: Image.network(model.cover, fit: BoxFit.fill),
                ),
              ),

              Text(
                model.originalTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                model.description,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                model.releaseDate,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              RateSection(rate: model.pages * 1.0),
            ],
          ),
        ),
      ),
    );
  }
}

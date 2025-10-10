import 'package:first_app/shop/data/book_model.dart';
import 'package:first_app/screens/book/book_details.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({super.key, required this.model});
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookDetails(model: model)),
      ),

      leading: Image.network(model.cover, width: 80, fit: BoxFit.cover),
      title: Text(model.title, overflow: TextOverflow.fade),
      subtitle: Text(model.description, overflow: TextOverflow.ellipsis),
    );
  }
}

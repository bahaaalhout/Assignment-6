import 'dart:convert';

import 'package:first_app/data/book_model.dart';
import 'package:first_app/widgets/book_list.dart';
import 'package:first_app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final List books = [];

  @override
  void initState() {
    super.initState();
    fetchBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Books'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return BookList(model: books[index]);
        },
        itemCount: books.length,
      ),
    );
  }

  fetchBook() async {
    Response data = await get(
      Uri.parse('https://potterapi-fedeperin.vercel.app/en/books'),
    );
    // print(data.body);
    var respone = jsonDecode(data.body);
    for (Map map in respone) {
      BookModel model = BookModel.fromjson(map);
      books.add(model);
    }
    setState(() {});
  }
}

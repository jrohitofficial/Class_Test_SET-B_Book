import 'package:flutter/material.dart';

import 'books.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  List<Books>? lstBooks;
  @override
  void didChangeDependencies() {
    lstBooks = ModalRoute.of(context)!.settings.arguments as List<Books>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Books'),
      ),
      body: ListView(
        children: [
          for (var books in lstBooks!) ...{
            ListTile(
              title: Text('Book Name : ${books.books}'),
              subtitle: Text('Author Name: ${books.author}'),
            )
          },
        ],
      ),
    );
  }
}

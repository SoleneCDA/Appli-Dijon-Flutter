import 'package:flutter/material.dart';
import 'package:petite_appli/models/Books.dart';
import 'package:petite_appli/services/getMethods.dart';

class BooksView extends StatefulWidget {
  const BooksView({super.key});

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchBooks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          List<Book> books = snapshot.data!;
          return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                Book book = books[index];
                String address = '${book.addressNumber} ${book.address}';
                return ListTile(
                  title: Text(book.label),
                  subtitle: Text(address),
                  leading: Text(book.city),
                );
              });
        } else {
          return const Text('une erreur est survenue');
        }
      },
    );
  }
}

import 'package:ringier_test_task/models/book.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookApi {
  static Future<List<Book>> fetchBook(String query) async {
    final response =
        await http.get(Uri.parse('https://api.itbook.store/1.0' + query));

    List<Book> filtered = [];

    int bookIndex = 10;
    int totalBooks = int.parse(jsonDecode(response.body)["total"]);

    if (totalBooks <= 10) {
      bookIndex = totalBooks;
    }

    if (response.statusCode == 200) {
      for (var i = 0; i < bookIndex; i++) {
        filtered.add(Book.fromJson(jsonDecode(response.body), i));
      }
      return filtered;
    } else {
      throw Exception('Failed to load books');
    }
  }
}

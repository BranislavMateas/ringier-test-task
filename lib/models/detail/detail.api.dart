import 'package:ringier_test_task/models/detail/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailApi {
  static Future<BookDetail> fetchDetail(String query) async {
    final response = await http
        .get(Uri.parse('https://api.itbook.store/1.0/books/' + query));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Details');
    }
  }
}

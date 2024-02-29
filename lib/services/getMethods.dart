import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:petite_appli/globals/apiURL.dart';
import 'package:petite_appli/models/Books.dart';
import 'package:petite_appli/models/Parking.dart';

Future<List<Parking>> fetchParkingAreas() async {
  try {
    final response = await http.get(
      Uri.parse("$apiURL/dispo-parking/records?limit=20"),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final results = json['results'] as List<dynamic>;

      return results.map((json) => Parking.fromJson(json)).toList();
    } else {
      throw Exception('failed to load bike spots');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<List<Book>> fetchBooks() async {
  try {
    final response = await http.get(
      Uri.parse("$apiURL/boites-a-livres/records?limit=20"),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final results = json['results'] as List<dynamic>;

      return results.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('failed to load');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

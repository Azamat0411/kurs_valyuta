import 'dart:convert';

import 'kurs.dart';
import 'package:http/http.dart' as http;

List<Kurs> parseKurs(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Kurs>((json) => Kurs.fromJson(json)).toList();
}

Future<List<Kurs>> fetchKurs() async {
  final response = await http
      .get(Uri.parse('https://cbu.uz/uz/arkhiv-kursov-valyut/json'));

  if (response.statusCode == 200) {
    return parseKurs(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
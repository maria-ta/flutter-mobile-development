import 'dart:convert';

import 'package:flutter_lab2/models/PostModel.dart';
import 'package:http/http.dart' as http;

class PlaceholderService {
  static Future<List<PostModel>> getPosts() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((p) => PostModel.fromJson(p))
          .toList();
    } else {
      throw Exception('Failed to login');
    }
  }

}
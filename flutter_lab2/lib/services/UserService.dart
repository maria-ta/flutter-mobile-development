import 'dart:convert';

import 'package:flutter_lab2/config/ApiConfig.dart';
import 'package:flutter_lab2/models/UserModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<UserModel> login(String username, String password) async {
    final response = await http.post(
      USER_API_URL,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to login');
    }
  }

  static Future<UserModel> registration(
      String username,
      String email,
      String password,
      String avatar,
  ) async {
    final response = await http.post(
      USER_API_URL,
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
        'avatar': avatar,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to login');
    }
  }

}
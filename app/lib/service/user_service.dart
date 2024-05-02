import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/user.dart';
import '../utils/constants.dart';

class UserService {
  static Future<http.Response> login(String username, String password) {
    return http.post(
      Uri.parse('${url}/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
  }

  static Future<http.Response> signup(User user, String password, Map<String, String> data) {
    return http.post(
      Uri.parse('${url}/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user': user.toJson(),
        'password': password,
        'data': data
      }),
    );
  }
}

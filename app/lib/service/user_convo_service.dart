
import 'package:dem_recip_mobile/service/service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserConvoService extends Service {
  static Future<void> create(String? username, Map<String, dynamic> data) async {

    String? token = await AuthService().currentUser?.getIdToken();
    
    String apiUrl = '${Service.baseUrl}/user_convo/create';
    try {
      var headers = <String, String>{};
      headers['Content-Type'] = 'application/json';
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      data['username'] = username;
    
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
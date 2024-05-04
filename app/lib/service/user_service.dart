import 'package:dem_recip_mobile/service/service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService extends Service {
  static Future<bool> checkQuestionnaireCompletion(String? username) async {

    String? token = await AuthService().currentUser?.getIdToken();
    
    String apiUrl = '${Service.baseUrl}/get_state';
    try {
      var headers = <String, String>{};
      headers['Content-Type'] = 'application/json';
      if (token != null) {
        headers['Authorization'] = 'Bearer $token'; // Set authorization token in header
      }

      var body = <String, dynamic>{};
      body['username'] = username; // Add username to request body
    
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        return body['data'] == 2 ? true : false;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
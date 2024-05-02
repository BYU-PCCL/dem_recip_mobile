import 'dart:convert';

class AuthResponse {
  final String? message;
  final String? token;
  final Map<String, String>? data;
  final int statusCode;

  AuthResponse(this.message, this.token, this.data, this.statusCode);

  factory AuthResponse.fromJson(String json, int statusCode) {
    Map<String, dynamic> parsedJson = jsonDecode(json);
    return AuthResponse(
      parsedJson['message'],
      parsedJson['token'],
      parsedJson['data'] != null ? Map<String, String>.from(parsedJson['data']) : null,
      statusCode, // Provide default value if statusCode is not present
    );
  }

  @override
  String toString() {
    return 'AuthResponse{message: $message, token: $token, data: $data, statusCode: $statusCode}';
  }
}

import 'package:dem_recip_mobile/utils/token_manager.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  final TokenManager _secureStorage = TokenManager();

  bool get isAuthenticated => _isAuthenticated;

  void checkAuthentication() async {
    String? token = await _secureStorage.getToken();
    _isAuthenticated = token != null;
    notifyListeners();
  }

  void login(String token) {
    _secureStorage.saveToken(token);
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _secureStorage.deleteToken();
    _isAuthenticated = false;
    notifyListeners();
  }
}

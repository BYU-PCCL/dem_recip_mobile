
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import '../utils/user.dart';
import '../service/user_service.dart';

class UserAuthPresenter {
  final dynamic _loginView;
  final dynamic _signupView;
  late AuthProvider _authProvider;

  UserAuthPresenter(this._loginView, this._signupView) {
    _authProvider = AuthProvider(); // Initialize _tokenManager within the constructor body
  }

  void login(String username, String password) async {
    var response = await UserService.login(username, password);
    if (response.statusCode == 200) {
      _authProvider.login(response.body); // Assume body contains token
      _loginView.navigateToHome();
    } else {
      _loginView.showError("Login Failed: ${response.body}");
    }
  }

  void signup(User user, String password, Map<String, String> data) async {
    var response = await UserService.signup(user, password, data);
    if (response.statusCode == 200) {
      _authProvider.login(response.body); // Assume body contains token
      _signupView.navigateToHome();
    } else {
      _signupView.showError("Signup Failed: ${response.body}");
    }
  }
}


import '../utils/user.dart';
import '../model/user.dart';
import '../utils/token_manager.dart';

class UserAuthPresenter {
  final dynamic _loginView;
  final dynamic _signupView;
  UserAuthPresenter(this._loginView, this._signupView);

  void login(String username, String password) async {
    var response = await ApiService.login(username, password);
    if (response.statusCode == 200) {
      TokenManager.saveToken(response.body); // Assume body contains token
      _loginView.navigateToHome();
    } else {
      _loginView.showError("Login Failed: ${response.body}");
    }
  }

  void signup(User user) async {
    var response = await ApiService.signup(user);
    if (response.statusCode == 200) {
      TokenManager.saveToken(response.body); // Assume body contains token
      _signupView.navigateToHome();
    } else {
      _signupView.showError("Signup Failed: ${response.body}");
    }
  }
}

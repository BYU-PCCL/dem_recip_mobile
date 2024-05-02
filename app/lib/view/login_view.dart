import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../presenter/auth_presenter.dart';

abstract class LoginView {
  void navigateToHome();
  void showError(String message);
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginView {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late UserAuthPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = UserAuthPresenter(this, null); // Passing null for signup view
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _presenter.login(_usernameController.text, _passwordController.text);
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text("Not a user? Signup"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void showError(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../presenter/auth_presenter.dart';
import '../utils/user.dart';

abstract class SignupView {
  void navigateToHome();
  void showError(String message);
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> implements SignupView {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthYearController = TextEditingController();
  final _raceController = TextEditingController();
  late UserAuthPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = UserAuthPresenter(null, this); // Passing null for login view
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
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
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: "First Name"),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              controller: _birthYearController,
              decoration: const InputDecoration(labelText: "Birth Year"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _raceController,
              decoration: const InputDecoration(labelText: "Race"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var user = User(
                  username: _usernameController.text,
                  password: _passwordController.text,
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  data: {
                    'birthYear': _birthYearController.text,
                    'race': _raceController.text,
                  }
                );
                _presenter.signup(user);
              },
              child: const Text("Signup"),
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

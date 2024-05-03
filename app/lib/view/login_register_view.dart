import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
    String? errorMessage = '';
    bool isLogin = true;

    final TextEditingController _controllerEmail = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();

    Future<void> signInWithEmailAndPassword() async {
      try {
        await AuthService().signInWithEmailAndPassword(
          email: _controllerEmail.text, 
          password: _controllerPassword.text
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
        });
      }
    }

    Future<void> createUserWithEmailAndPassword() async {
      try {
        await AuthService().createUserWithEmailAndPassword(
          email: _controllerEmail.text, 
          password: _controllerPassword.text
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
        });
      }
    }

    Widget _title() {
      return const Text("Firebase Auth");
    }

    Widget _entryField(
      String title,
      TextEditingController controller,
      bool isSensitive
    ) {
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title
        ),
        obscureText: isSensitive,
        enableSuggestions: !isSensitive,
        autocorrect: !isSensitive,
      );
    }

    Widget _submitButton() {
      return ElevatedButton(
        onPressed: 
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword, 
        child: Text(isLogin ? 'Login' : 'Register')
      );
    }

    Widget _loginOrRegisterButton() {
      return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        }, 
        child: Text(isLogin ? 'Register instead' : 'Login instead')
      );
    }

    Widget _errorMessage() {
      return Text(errorMessage == '' ? '' : 'Error: $errorMessage');
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _entryField('email', _controllerEmail, false),
            _entryField('password', _controllerPassword, true),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton()
          ],
        ),
      ),
    );
  }
}

import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = AuthService().currentUser;

    Future<void> signOut() async {
      await AuthService().signOut();
    }

    Widget _userUid() {
      return Text(user?.email ?? 'User email');
    }

    Widget _signOutButton() {
      return ElevatedButton(
        onPressed: signOut,
        child: const Text("Sign Out"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Auth"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            const SizedBox(height: 20),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}

import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/login_register_view.dart';
import 'package:dem_recip_mobile/view/navigation/opening_navigator.dart';
import 'package:flutter/material.dart';

class AuthNavigator extends StatefulWidget {
  const AuthNavigator({super.key});

  @override
  State<AuthNavigator> createState() => _AuthNavigatorState();
}

class _AuthNavigatorState extends State<AuthNavigator> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges, 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return OpeningNavigator();
        } else {
          return const LoginView();
        }
      }
    );
  }
}
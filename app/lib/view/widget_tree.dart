import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/login_register_view.dart';
import 'package:dem_recip_mobile/view/tab_navigation.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges, 
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const TabNav();
        } else {
          return const LoginView();
        }
      }
    );
  }
}
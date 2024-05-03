
import 'package:dem_recip_mobile/view/home_view.dart';
import 'package:dem_recip_mobile/view/profile_view.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/home', // Initial route for HomeNavigator
      onGenerateRoute: (settings) {
        // Define routes for HomeNavigator
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (context) => const HomeView());
          case '/profile':
            return MaterialPageRoute(builder: (context) => const ProfileView());
          default:
            return null; // Handle unknown routes
        }
      },
    );
  }
}
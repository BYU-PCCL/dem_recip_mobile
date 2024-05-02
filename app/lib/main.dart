import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:flutter/material.dart';
import './view/login_view.dart';
import './view/signup_view.dart';
import './view/home_view.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => AuthProvider()..checkAuthentication(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVP App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

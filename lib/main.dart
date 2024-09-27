import 'package:flutter/material.dart';
import 'screens/lp_screen.dart';  // Importing Landing Page Screen
import 'screens/login_screen.dart';  // Importing Login Screen
import 'screens/signup_screen.dart';  // Importing SignUp Screen
import 'screens/dashboard_screen.dart';  // Importing Dashboard Screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key}); // Adding const constructor and key

  @override
  _MyAppState createState() => _MyAppState(); // Create the state of MyApp
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Primary theme color
      ),
      initialRoute: '/', // Define initial route
      routes: {
        '/': (context) => const LPScreen(),  // Landing Page Screen
        '/login': (context) => const LoginPage(),  // Login Screen
        '/signup': (context) => const SignupScreen(),  // SignUp Screen
        '/dashboard': (context) => const DashboardScreen(),  // Dashboard Screen
      },
    );
  }
}

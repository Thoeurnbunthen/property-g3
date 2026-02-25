import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Purple Life',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Purple Life Home'),
        '/login': (context) => const LoginPage(),
                '/signup': (context) => const SignupPage(),

        
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:property_g3/routes/app_routes.dart'; // Use correct name
import 'package:property_g3/screen/navbar.dart';    // Use correct name

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D2D44)),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.navbar, 
      routes: AppRoutes.routes,
    );
  }
}
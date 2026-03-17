import 'package:flutter/material.dart';
import 'package:property/routes/app_routes.dart'; // adjust path as needed

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
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}

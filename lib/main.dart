import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import your project files
import 'screens/home_screen.dart'; 
import 'providers/favorite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // This provides the "Favorite" state to the whole app
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const PropertyG3App(),
    ),
  );
}

class PropertyG3App extends StatelessWidget {
  const PropertyG3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Property G3',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1), // Modern Indigo
        ),
      ),
      // This tells the app to start on your Property List screen
      home: const HomeScreen(), 
    );
  }
}
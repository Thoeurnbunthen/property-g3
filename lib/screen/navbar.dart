import 'package:flutter/material.dart';
import 'package:property_g3/screen/home.dart';
import 'package:property_g3/screen/favorite.dart';
import 'package:property_g3/screen/profile.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  // 1. Add the Login and Signup widgets to this list
  final List<Widget> _screens = [
    const Home(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF0D2D44),
        unselectedItemColor: Colors.grey,
        // 'fixed' is good here because you have 5 items; it prevents shifting animations
        type: BottomNavigationBarType.fixed, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
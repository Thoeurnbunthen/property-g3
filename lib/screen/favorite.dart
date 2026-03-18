import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFF0D2D44),
            child: Icon(Icons.arrow_back, color: Colors.white, size: 18),
          ),
        ),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFF0D2D44),
              child: Icon(Icons.notifications, color: Colors.white, size: 18),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFF0D2D44),
              child: Icon(Icons.menu, color: Colors.white, size: 18),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Favorite",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // The list of cards
              Expanded(
                child: ListView(
                  children: const [
                    _FavoriteCard(),
                    _FavoriteCard(),
                    _FavoriteCard(),
                    _FavoriteCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Custom Bottom Navigation Bar
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF0D2D44),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Colors.white, size: 30),
            Icon(Icons.favorite, color: Colors.white, size: 30),
            Icon(Icons.person, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  const _FavoriteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Grey box from image
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://via.placeholder.com/100', // Replace with your asset image
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          // Info Section
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apartment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "2 Bed Room",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  "\$150.00",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
          // Heart Icon
          const CircleAvatar(
            backgroundColor: Color(0xFF0D2D44),
            radius: 18,
            child: Icon(Icons.favorite, color: Colors.red, size: 18),
          ),
        ],
      ),
    );
  }
}

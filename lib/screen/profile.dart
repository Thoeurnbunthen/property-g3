import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF0D2B45),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: Colors.black),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.editProfile),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // --- PROFILE IMAGE SECTION ---
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/profile_pic.png',
                      ), // Replace with your image
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  "Brooklyn Simmons",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // --- USER INFO LIST ---
          _buildInfoTile(Icons.person_outline, "Name", "Ra Jessika"),
          _buildInfoTile(Icons.email_outlined, "Email", "jesssi@gmail.com"),
          _buildInfoTile(
            Icons.phone_outlined,
            "Phone number",
            "098 834 752 90",
          ),

          const Spacer(),

          // --- SIGN OUT BUTTON ---
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sign Out",
              style: TextStyle(
                color: Color(0xFF0D2B45),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0D2B45), size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B4C), // dark blue
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
    );
  }
}

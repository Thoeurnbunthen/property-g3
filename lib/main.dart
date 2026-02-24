import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PropertyHomeScreen()));

class PropertyHomeScreen extends StatelessWidget {
  const PropertyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // --- Header & Location ---
              const Text("Your current locations", style: TextStyle(color: Colors.grey)),
              const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.deepPurple, size: 20),
                  SizedBox(width: 5),
                  Text("Phnom Penh, Tul Kork", 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
              const SizedBox(height: 20),

              // --- Search Bar ---
              TextField(
                decoration: InputDecoration(
                  hintText: "Search address, city, location",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.tune),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // --- Categories ---
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryItem(label: "House", icon: Icons.home_work_outlined),
                  CategoryItem(label: "Apartment", icon: Icons.apartment),
                  CategoryItem(label: "Villa", icon: Icons.villa_outlined),
                  CategoryItem(label: "Bungalows", icon: Icons.holiday_village_outlined),
                ],
              ),
              const SizedBox(height: 30),

              // --- Most Popular Section ---
              const SectionHeader(title: "Most Popular", count: "243 properties"),
              const SizedBox(height: 15),
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PropertyCard(
                      title: "Small cottage with great view",
                      location: "Kadaghari, Kathmandu",
                      price: "526",
                      rating: "4.8",
                    ),
                    PropertyCard(
                      title: "Modern Minimalist Villa",
                      location: "Boeung Keng Kang, PP",
                      price: "850",
                      rating: "4.9",
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              const SectionHeader(title: "Top Rated", count: ""),
              // Add vertical list or grid here for "All"
            ],
          ),
        ),
      ),
    );
  }
}

// --- Supporting Widgets ---

class CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;
  const CategoryItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
          ),
          child: Icon(icon, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String count;
  const SectionHeader({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            if (count.isNotEmpty) Text(count, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        TextButton(onPressed: () {}, child: const Text("See all")),
      ],
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String title, location, price, rating;
  const PropertyCard({super.key, required this.title, required this.location, required this.price, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=500'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10, right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    child: const Icon(Icons.favorite_border, color: Colors.red),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    Text(" $rating", style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 10),
                Text("\$$price / month", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent, fontSize: 16)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
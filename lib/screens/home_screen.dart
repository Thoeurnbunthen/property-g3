import 'package:flutter/material.dart';
import '../widgets/property_card.dart';
import '../models/property_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeader(),
            _buildSearchBar(),
            _buildCategories(),
            _buildHorizontalSection("Most Popular", popularProperties),
            _buildVerticalSection("Top Rated", popularProperties),
          ],
        ),
      ),
    );
  }

  // --- Professional Sliver Sections for Smooth Scrolling ---

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your current locations", style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.deepPurple, size: 22),
                const SizedBox(width: 4),
                const Text("Phnom Penh, Tul Kork", 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search address, city, location",
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: const Icon(Icons.tune),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _catIcon(Icons.home, "House"),
            _catIcon(Icons.apartment, "Apartment"),
            _catIcon(Icons.villa, "Villa"),
            _catIcon(Icons.bungalow, "Bungalows"),
          ],
        ),
      ),
    );
  }

  Widget _catIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildHorizontalSection(String title, List<Property> list) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          _sectionHeader(title),
          SizedBox(
            height: 340,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) => PropertyCard(property: list[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalSection(String title, List<Property> list) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          _sectionHeader(title, padding: 0),
          ...list.map((p) => PropertyCard(property: p, isHorizontal: false)),
        ]),
      ),
    );
  }

  Widget _sectionHeader(String title, {double padding = 20}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          TextButton(onPressed: () {}, child: const Text("See all")),
        ],
      ),
    );
  }
}
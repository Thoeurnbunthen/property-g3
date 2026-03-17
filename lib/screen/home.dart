import 'package:flutter/material.dart';
// Ensure these imports match your actual file names and locations
import 'package:property_g3/screen/login.dart'; 
import 'package:property_g3/screen/signup.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // GlobalKey to control the Scaffold (required to open drawer from a custom button)
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  String _selectedCategory = "All";

  final List<Map<String, String>> _allProperties = [
    {"title": "Opera House", "price": "100\$", "type": "House", "image": "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=400"},
    {"title": "Sky Villa", "price": "150\$", "type": "Villa", "image": "https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=400"},
    {"title": "Ocean View", "price": "120\$", "type": "Apartment", "image": "https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?w=400"},
    {"title": "Green Resort", "price": "90\$", "type": "Rental", "image": "https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?w=400"},
    {"title": "Modern Mansion", "price": "250\$", "type": "House", "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=500"},
    {"title": "City Apartment", "price": "110\$", "type": "Apartment", "image": "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=500"},
    {"title": "Luxe Penthouse", "price": "400\$", "type": "Apartment", "image": "https://images.unsplash.com/photo-1567496898669-ee935f5f647a?w=500"},
    {"title": "Glass House", "price": "320\$", "type": "House", "image": "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=500"},
    {"title": "Mountain Chalet", "price": "180\$", "type": "Villa", "image": "https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?w=500"},
    {"title": "Beach Cabin", "price": "65\$", "type": "Rental", "image": "https://images.unsplash.com/photo-1499793983690-e29da59ef1c2?w=400"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredProperties = _selectedCategory == "All"
        ? _allProperties
        : _allProperties.where((p) => p['type'] == _selectedCategory).toList();

    return Scaffold(
      key: _scaffoldKey, // Link the key to the Scaffold
      backgroundColor: Colors.white,
      
      // --- SIDE DRAWER ---
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0D2D44)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.real_estate_agent, color: Colors.white, size: 50),
                    SizedBox(height: 10),
                    Text("Property App", style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login, color: Color(0xFF0D2D44)),
              title: const Text("Login"),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration, color: Color(0xFF0D2D44)),
              title: const Text("Register"),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 25),
              _buildSectionHeader("Most popular"),
              const SizedBox(height: 15),
              _buildCategoryList(),
              const SizedBox(height: 20),

              // Horizontal Scroll List
              SizedBox(
                height: 300, 
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    final item = filteredProperties[index];
                    return _propertyCard(context, item['title']!, item['price']!, item['image']!);
                  },
                ),
              ),

              const SizedBox(height: 10),
              _buildSectionHeader("Featured Properties"),
              const SizedBox(height: 15),

              // Vertical List
              Column(
                children: filteredProperties.map((item) {
                  return _propertyCard(context, item['title']!, item['price']!, item['image']!, isWide: true);
                }).toList(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Find your best\nprivate space",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, height: 1.2),
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF0D2D44),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white, size: 20),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: const Color(0xFF0D2D44),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 20),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer(); // Open Drawer
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300), 
        borderRadius: BorderRadius.circular(10)
      ),
      child: const Row(
        children: [
          Text("All Category"),
          Icon(Icons.arrow_drop_down),
          SizedBox(height: 30, child: VerticalDivider(width: 20)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "What are you looking for...", 
                border: InputBorder.none
              )
            )
          ),
          Icon(Icons.search, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text("View all", style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildCategoryList() {
    final categories = ["All", "House", "Apartment", "Rental", "Villa"];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _categoryChip(categories[index]);
        },
      ),
    );
  }

  Widget _categoryChip(String label) {
    bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = label),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0D2D44) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: Colors.grey.shade300),
        ),
        child: Center(
          child: Text(label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black, 
              fontWeight: FontWeight.w500
            )
          ),
        ),
      ),
    );
  }

  Widget _propertyCard(BuildContext context, String title, String price, String imgUrl, {bool isWide = false}) {
    return Container(
      width: isWide ? double.infinity : 220,
      margin: const EdgeInsets.only(right: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(imgUrl, height: isWide ? 200 : 150, width: double.infinity, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: isWide ? 200 : 150, 
                color: Colors.grey[300], 
                child: const Icon(Icons.broken_image, color: Colors.grey)
              )
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Row(children: [Icon(Icons.star, color: Colors.orange, size: 16), Text(" 4.5", style: TextStyle(fontWeight: FontWeight.bold))]),
            ],
          ),
          const Text("Comfortable and private space with high-speed wifi.", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xFF0D2D44), borderRadius: BorderRadius.circular(15)),
                child: Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const Icon(Icons.favorite_border, color: Color(0xFF0D2D44)),
            ],
          )
        ],
      ),
    );
  }
}
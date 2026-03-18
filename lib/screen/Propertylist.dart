import 'package:flutter/material.dart';

void main() {
  runApp(const ProtertyList());
}

class ProtertyList extends StatelessWidget {
  const ProtertyList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Listing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A3C5E)),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const PropertyListingScreen(),
    );
  }
}

class Property {
  final String title;
  final String location;
  final String price;
  final double rating;
  final int reviews;
  final int beds;
  final int baths;
  final String imageUrl;
  final bool isFavorite;

  const Property({
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.beds,
    required this.baths,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

final List<Property> mostPopularProperties = [
  const Property(
    title: 'Small cottage with\ngreat view of bagnold',
    location: 'Temperate, West Bavaria, CF',
    price: '\$526',
    rating: 4.9,
    reviews: 244,
    beds: 3,
    baths: 2,
    imageUrl:
        'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=400',
  ),
  const Property(
    title: 'Modern lakeside\ncabin retreat',
    location: 'Lakewood, North Alps, DE',
    price: '\$412',
    rating: 4.7,
    reviews: 189,
    beds: 2,
    baths: 1,
    imageUrl:
        'https://images.unsplash.com/photo-1449844908441-8829872d2607?w=400',
  ),
];

final List<Property> topRatedProperties = [
  const Property(
    title: 'Entire private villa in\nSurabaya City',
    location: 'Temperate, West Bavaria, CF',
    price: '\$400',
    rating: 4.9,
    reviews: 488,
    beds: 4,
    baths: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=400',
    isFavorite: true,
  ),
];

final List<Property> allProperties = [
  const Property(
    title: 'Entire private villa in\nSurabaya City',
    location: 'Temperate, West Bavaria, CF',
    price: '\$400',
    rating: 4.9,
    reviews: 400,
    beds: 4,
    baths: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=400',
  ),
  const Property(
    title: 'Entire private villa in\nSurabaya City',
    location: 'Temperate, West Bavaria, CF',
    price: '\$400',
    rating: 4.8,
    reviews: 380,
    beds: 3,
    baths: 2,
    imageUrl:
        'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=400',
  ),
  const Property(
    title: 'Entire private villa in\nSurabaya City',
    location: 'Temperate, West Bavaria, CF',
    price: '\$490',
    rating: 4.7,
    reviews: 320,
    beds: 5,
    baths: 4,
    imageUrl:
        'https://images.unsplash.com/photo-1505843513577-22bb7d21e455?w=400',
  ),
];

class PropertyListingScreen extends StatefulWidget {
  const PropertyListingScreen({super.key});

  @override
  State<PropertyListingScreen> createState() => _PropertyListingScreenState();
}

class _PropertyListingScreenState extends State<PropertyListingScreen> {
  int _selectedNavIndex = 0;
  final Set<int> _favorites = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildMostPopularSection(),
                    _buildTopRatedSection(),
                    _buildAllSection(),
                  ],
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search location...',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF1A3C5E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                  letterSpacing: -0.3,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            child: const Text(
              'See all',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF4A90D9),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMostPopularSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Most Popular', '214 properties for 1 full week'),
        const SizedBox(height: 14),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: mostPopularProperties.length,
            itemBuilder: (context, index) {
              return _buildHorizontalCard(mostPopularProperties[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalCard(Property property, int index) {
    final isFav = _favorites.contains(index);
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  property.imageUrl,
                  width: 200,
                  height: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 130,
                    color: const Color(0xFFE8EFF5),
                    child: Icon(Icons.home, size: 40, color: Colors.grey[400]),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => setState(() {
                    if (isFav)
                      _favorites.remove(index);
                    else
                      _favorites.add(index);
                  }),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      size: 16,
                      color: isFav ? Colors.red : Colors.grey[400],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 11,
                        color: Color(0xFFFFC107),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${property.rating}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${property.price}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A3C5E),
                      ),
                    ),
                    Text(
                      '/night',
                      style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRatedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Top rated', 'See all'),
        const SizedBox(height: 14),
        ...topRatedProperties.asMap().entries.map(
          (e) => _buildWideCard(e.value, 100 + e.key, isTopRated: true),
        ),
      ],
    );
  }

  Widget _buildAllSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('All', ''),
        const SizedBox(height: 14),
        ...allProperties.asMap().entries.map(
          (e) => _buildWideCard(e.value, 200 + e.key),
        ),
      ],
    );
  }

  Widget _buildWideCard(
    Property property,
    int index, {
    bool isTopRated = false,
  }) {
    final isFav = _favorites.contains(index);
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
                child: Image.network(
                  property.imageUrl,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 110,
                    height: 110,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8EFF5),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(16),
                      ),
                    ),
                    child: Icon(Icons.home, size: 32, color: Colors.grey[400]),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 11,
                        color: Color(0xFFFFC107),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${property.rating}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 11,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          property.location,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[400],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _buildAmenityChip(Icons.bed_outlined, '${property.beds}'),
                      const SizedBox(width: 8),
                      _buildAmenityChip(
                        Icons.bathtub_outlined,
                        '${property.baths}',
                      ),
                      const SizedBox(width: 8),
                      _buildAmenityChip(
                        Icons.people_outline,
                        '${property.reviews}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: property.price,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1A3C5E),
                              ),
                            ),
                            const TextSpan(
                              text: '/night',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFFAAAAAA),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          if (isFav)
                            _favorites.remove(index);
                          else
                            _favorites.add(index);
                        }),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: isFav
                                ? const Color(0xFF1A3C5E).withOpacity(0.1)
                                : const Color(0xFFF0F4F8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            size: 14,
                            color: isFav
                                ? const Color(0xFF1A3C5E)
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 12, color: Colors.grey[400]),
        const SizedBox(width: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[500],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    final items = [
      Icons.home_rounded,
      Icons.favorite_border_rounded,
      Icons.search_rounded,
      Icons.person_outline_rounded,
    ];

    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = _selectedNavIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedNavIndex = index),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[index],
                    size: 24,
                    color: isSelected
                        ? const Color(0xFF1A3C5E)
                        : Colors.grey[400],
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A3C5E),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

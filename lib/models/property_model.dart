class Property {
  final String id; // Unique ID for Favorite logic
  final String title;
  final String location;
  final String price;
  final String rating;
  final int reviews;
  final String imageUrl;
  final String area;
  final int rooms;

  Property({
    required this.id,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.area,
    required this.rooms,
  });
}

// Mock Data for testing
final List<Property> popularProperties = [
  Property(
    id: "p1",
    title: "Small cottage with great view",
    location: "Kadaghari, Kathmandu",
    price: "526",
    rating: "4.8",
    reviews: 73,
    area: "673 m2",
    rooms: 2,
    imageUrl: "https://images.unsplash.com/photo-1518780664697-55e3ad937233?q=80&w=500",
  ),
  Property(
    id: "p2",
    title: "Modern apartment in city center",
    location: "Phnom Penh, Tuol Kork",
    price: "850",
    rating: "4.5",
    reviews: 120,
    area: "120 m2",
    rooms: 3,
    imageUrl: "https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=500",
  ),
  Property(
    id: "p3",
    title: "Luxurious villa with private pool",
    location: "Siem Reap, Cambodia",
    price: "1500",
    rating: "4.9",
    reviews: 54,
    area: "350 m2",
    rooms: 4,
    imageUrl: "https://images.unsplash.com/photo-1507089947368-19c1da9775ae?q=80&w=500",
  ),
  Property(
    id: "p4",
    title: "Cozy studio near university",
    location: "Phnom Penh, Boeng Keng Kang",
    price: "400",
    rating: "4.2",
    reviews: 200,
    area: "45 m2",
    rooms: 1,
    imageUrl: "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=500",
  ),
  Property(
    id: "p5",
    title: "Beachfront bungalow",
    location: "Kep, Cambodia",
    price: "980",
    rating: "4.7",
    reviews: 89,
    area: "210 m2",
    rooms: 2,
    imageUrl: "https://images.unsplash.com/photo-1505691723518-34f5d3876a23?q=80&w=500",
  ),
];
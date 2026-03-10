import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/property_model.dart';
import '../providers/favorite_provider.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final bool isHorizontal;

  const PropertyCard({super.key, required this.property, this.isHorizontal = true});

  @override
  Widget build(BuildContext context) {
    // We watch the provider here so the heart updates instantly
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final bool isFav = favoriteProvider.isFavorite(property.id);

    return Container(
      width: isHorizontal ? 280 : double.infinity,
      margin: EdgeInsets.only(right: isHorizontal ? 16 : 0, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(context, isFav, favoriteProvider),
          _buildDetails(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, bool isFav, FavoriteProvider provider) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: Image.network(property.imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
        ),
        Positioned(
          top: 12, right: 12,
          child: GestureDetector(
            onTap: () => provider.toggleFavorite(property.id),
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    final textStyleTitle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    final textStyleSub = const TextStyle(fontSize: 12, color: Colors.grey);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(property.title, style: textStyleTitle, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(property.location, style: textStyleSub, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${property.price}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  const SizedBox(width: 2),
                  Text(property.rating, style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 4),
                  Text("(${property.reviews})", style: textStyleSub),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.square_foot, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(property.area, style: textStyleSub),
              const SizedBox(width: 16),
              const Icon(Icons.bed, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text("${property.rooms} rooms", style: textStyleSub),
            ],
          ),
        ],
      ),
    );
  }
}
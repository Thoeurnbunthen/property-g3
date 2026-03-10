import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  // Store the IDs of favorited properties
  final List<String> _favoriteIds = [];

  List<String> get favoriteIds => _favoriteIds;

  void toggleFavorite(String propertyId) {
    if (_favoriteIds.contains(propertyId)) {
      _favoriteIds.remove(propertyId);
    } else {
      _favoriteIds.add(propertyId);
    }
    // This tells all widgets listening to this provider to rebuild
    notifyListeners();
  }

  bool isFavorite(String propertyId) {
    return _favoriteIds.contains(propertyId);
  }
}
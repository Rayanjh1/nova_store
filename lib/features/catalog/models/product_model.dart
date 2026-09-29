import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final double originalPrice;
  final double rating;
  final int reviewsCount;
  final String category;
  final String imageUrl;
  final List<String> tags;
  final bool isFeatured;
  final List<String> colors;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviewsCount,
    required this.category,
    required this.imageUrl,
    required this.tags,
    this.isFeatured = false,
    this.colors = const [],
  });

  double get discountPercent =>
      originalPrice > price ? ((originalPrice - price) / originalPrice) * 100 : 0;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        originalPrice,
        rating,
        reviewsCount,
        category,
        imageUrl,
        tags,
        isFeatured,
        colors,
      ];
}

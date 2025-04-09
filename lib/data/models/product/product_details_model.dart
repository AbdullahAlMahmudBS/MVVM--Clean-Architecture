import 'package:flutter_mvvm_prac_1_eu/domain/entities/product/product_details.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class ProductDetailsModel {
  final String id;
  final String name;
  final double price;
  final String description;
  final String category;
  final String imageUrl;
  final RatingModel rating;

  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'].toString(), // In case id is int
      name: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      imageUrl: json['image'] ?? '',
      rating: RatingModel.fromJson(json['rating'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': name,
      'price': price,
      'description': description,
      'category': category,
      'image': imageUrl,
      'rating': rating.toJson(),
    };
  }

  ProductDetails toDomain() => ProductDetails(
    id: id,
    name: name,
    price: price,
    description: description,
    category: category,
    imageUrl: imageUrl,
    ratingRate: rating.rate,
    ratingCount: rating.count,
  );
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] ?? 0).toDouble(),
      count: (json['count'] ?? 0).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}

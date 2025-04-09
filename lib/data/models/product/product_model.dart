import '../../../domain/entities/product/product.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': image,
    };
  }

  Product toDomain() => Product(
    id: id,
    name: title,
    price: price,
    imageUrl: image,
  );
}

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

/**
 * Created by Abdullah on 8/4/25.
 */
class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
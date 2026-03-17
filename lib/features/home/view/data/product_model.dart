import 'package:flutter/foundation.dart';

class ProductModel {
  final int? id;
  final String? name;
  final String? image;
  final String? price;
  final String? description;
  final String? rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      rating: json['rating'],
    );
  }
}

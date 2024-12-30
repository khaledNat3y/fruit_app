import 'dart:io';

import 'package:fruits_app/core/models/review_model.dart';

import '../entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final num sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.sellingCount,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.isOrganic
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        name: json['name'],
        code: json['code'],
        description: json['description'],
        price: json['price'],
        sellingCount: json['sellingCount'],
        isFeatured: json['isFeatured'],
        image: File(json['image']),
        imageUrl: json['imageUrl'],
        expirationMonths: json['expirationMonths'],
        numberOfCalories: json['numberOfCalories'],
        unitAmount: json['unitAmount'],
        isOrganic: json['isOrganic'],
        reviews: json['reviews'].map((e) => ReviewModel.fromJson(e)).toList());
  }
  ProductEntity toEntity() {
    return ProductEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        isFeatured: isFeatured,
        imageUrl: imageUrl,
        expirationMonths: expirationMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        reviews: reviews.map((e) => e.toEntity()).toList(),
        image: image);
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'sellingCount' : sellingCount,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews' : reviews.map((e) => e.toJson()).toList()
    };
  }
}
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruits_app/core/entities/review_entity.dart';


class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    this.isOrganic = false,
  });

  @override
  List<Object?> get props => [code];
}
import 'dart:io';

import 'package:fruits_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
      name: "name",
      code: "code",
      description: "description",
      price: 1.0,
      isFeatured: true,
      imageUrl: "imageUrl",
      expirationMonths: 1,
      numberOfCalories: 1,
      unitAmount: 1,
      isOrganic: true,
      reviews: [],
);
}

List<ProductEntity> getDummyProducts() {
  List<ProductEntity> products = [];
  for (int i = 0; i < 10; i++) {
    products.add(getDummyProduct());
  }
  return products;
}
import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';

import '../../../../../core/widgets/fruit_item.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 163 / 214,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return FruitItem(productEntity: products[index],);
        });
  }
}

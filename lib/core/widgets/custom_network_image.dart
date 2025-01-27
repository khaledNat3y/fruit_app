import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
  });


  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
            Assets.imagesFruits); // Local placeholder
      },
    );
  }
}
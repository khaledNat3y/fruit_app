import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItem extends StatelessWidget {
  final String imagePath;

  const InActiveItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
        child: SvgPicture.asset(imagePath));
  }
}

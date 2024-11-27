import 'package:flutter/material.dart';

import '../../../domain/entites/bottom_navigation_bar_entity.dart';
import 'active_item.dart';
import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            label: bottomNavigationBarEntity.label,
            imagePath: bottomNavigationBarEntity.activeImage,
          )
        : InActiveItem(
            imagePath: bottomNavigationBarEntity.inActiveImage);
  }
}

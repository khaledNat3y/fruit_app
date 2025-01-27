import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:intl/intl.dart';
import '../../../../../core/theming/app_colors.dart';
import 'navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int>? onItemTapped;
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomNavigationItems.asMap().entries.map((entry) {
          var index = entry.key;
          var entity = entry.value;
          return Expanded(
            flex: index == currentIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.onItemTapped!(index);
                });
              },
              child: NavigationBarItem(
                bottomNavigationBarEntity: entity,
                isSelected: currentIndex == index,

              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}





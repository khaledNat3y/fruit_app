import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/theming/app_colors.dart';

class BackButtonWithBlackCircleBorder extends StatelessWidget {
  final bool withBorder;
  const BackButtonWithBlackCircleBorder({super.key, required this.withBorder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: withBorder ? Border.all(color: AppColors.lighterGrey):Border.all(color: AppColors.white),
          ),
          child: SizedBox(
            width: 45.w,
            height: 45.h,
            child: IconButton(onPressed: (){
              context.pop();
            }, icon: const Icon(Icons.arrow_back_ios_new),),
          ),
        ),
      ),
    );
  }
}
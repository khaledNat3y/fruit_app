import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/theming/app_colors.dart';

class BackButtonWithBlackCircleBorder extends StatelessWidget {
  const BackButtonWithBlackCircleBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.lighterGrey),
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/app_colors.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class CustomThirdPartyLoginWidget extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;
  const CustomThirdPartyLoginWidget({super.key, required this.image, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: AppColors.lighterGrey,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            horizontalSpace(10),
            SvgPicture.asset(image, width: 30.w, height: 30.h,),
            horizontalSpace(53),
            Text(title, style: AppStyles.font16SemiBold.copyWith(fontFamily: "Vibes"),),
          ],
        ),
      ),
    );
  }
}

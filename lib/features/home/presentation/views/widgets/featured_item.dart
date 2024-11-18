import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../generated/l10n.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: Container(
        width: screenWidth,
        color: AppColors.white,
        child: Stack(
          children: [
            Positioned.fill(
                left: 0,
                bottom: 0,
                right: screenWidth * 0.4,
                child: SvgPicture.asset(
                  Assets.imagesPageViewItem2Image,
                  fit: BoxFit.fill,
                )),
            Container(
              width: screenWidth * 0.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: svg.Svg(Assets.imagesFeaturedItemBackground),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(25),
                    Text(
                      S.of(context).eid_offers,
                      style: AppStyles.font13Regular
                          .copyWith(color: AppColors.white),
                    ),
                    Spacer(),
                    Text(
                      "${S.of(context).discount} 25%",
                      style:
                          AppStyles.font19Bold.copyWith(color: AppColors.white),
                    ),
                    verticalSpace(7),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: CustomButton(
                          buttonText: "تسوق الان",
                          textStyle: AppStyles.font13Bold
                              .copyWith(color: AppColors.primaryColor),
                          backgroundColor: AppColors.white,
                          borderRadius: 4.r,
                          onPressed: () {}),
                    ),
                    verticalSpace(29)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

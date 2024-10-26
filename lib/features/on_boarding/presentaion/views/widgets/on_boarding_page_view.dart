import 'package:flutter/material.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import 'package:fruits_app/features/on_boarding/presentaion/views/widgets/page_view_item.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;
  const OnBoardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      // reverse: true,
      children: [
        PageViewItem(
            isVisible: true,
            image: Assets.imagesPageViewItem1Image,
            backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
            subtitle: S.of(context).onboarding_intro_one,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).onboarding_intro_title_one, style: AppStyles.font23Bold,),
                Text(" HUB", style: AppStyles.font23Bold.copyWith(color: AppColors.secondaryColor),),
                Text("Fruit", style: AppStyles.font23Bold.copyWith(color: AppColors.primaryColor),),
              ],
            )),
        PageViewItem(
            isVisible: false,
            image: Assets.imagesPageViewItem2Image,
            backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
            subtitle: S.of(context).onboarding_intro_two,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).search_and_shop,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF0C0D0D),
                    fontSize: 23,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

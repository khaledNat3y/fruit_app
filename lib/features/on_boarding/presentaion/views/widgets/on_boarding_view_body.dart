import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/constant/constant.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/routing/routes.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/on_boarding/presentaion/views/widgets/on_boarding_page_view.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        verticalSpace(29),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
          ),
          child: Visibility(
            visible: currentPage == 1 ? true : false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: SizedBox(
              height: 54.h,
              child: CustomButton(
                  buttonText: S.of(context).start_now,
                  textStyle: AppStyles.font18WhiteMedium,
                  backgroundColor: AppColors.primaryColor,
                  verticalPadding: 0.0,
                  onPressed: () {
                    Prefs.setBool(kIsOnBoardingViewSeen, true);
                    context.pushReplacementNamed(Routes.loginScreen);
                  }),
            ),
          ),
        ),
        verticalSpace(43),
      ],
    );
  }
}

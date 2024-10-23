import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/routing/routes.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisible;
  const PageViewItem({super.key, required this.image, required this.backgroundImage, required this.subtitle, required this.title, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill,)),
              Positioned(
                bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(image,)),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: (){
                    Prefs.setBool(kIsOnBoardingViewSeen, true);
                    context.pushReplacementNamed(Routes.loginScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(S.of(context).skip, style: TextStyles.font13Regular.copyWith(
                      color: AppColors.lightGrey
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(64),
        title,
        verticalSpace(16),
        Text(subtitle,style: TextStyles.font13SemiBold.copyWith(
          color: AppColors.designGrey
        ), textAlign: TextAlign.center,),
      ],
    );
  }
}
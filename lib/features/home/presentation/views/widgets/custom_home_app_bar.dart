import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'package:fruits_app/core/theming/text_styles.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../generated/l10n.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(S.of(context).welcome_message),
      titleTextStyle: AppStyles.font16Regular.copyWith(color: AppColors.lightGrey),
      subtitle: const Text("خالد نتعي"),
      subtitleTextStyle: AppStyles.font16Bold.copyWith(color: AppColors.black),
      trailing: Container(
        padding: const EdgeInsets.all(12),
        decoration: const ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      )

    );
  }
}
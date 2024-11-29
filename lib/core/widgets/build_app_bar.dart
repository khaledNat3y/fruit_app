import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/features/best_selling_fruits/presentation/views/widgets/back_button_with_black_circle_border.dart';
import '../theming/text_styles.dart';
import 'notification_widget.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    elevation: 0,
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: const NotificationWidget(),
      )
    ],
    title: Text(title, style: AppStyles.font19Bold,),
    centerTitle: true,
    leading: const BackButtonWithBlackCircleBorder(),
  );
}


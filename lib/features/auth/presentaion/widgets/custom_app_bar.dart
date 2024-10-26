import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/app_colors.dart';

import '../../../../core/theming/text_styles.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
  return AppBar(
    leading: buildAppBarLeading(),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.font19Bold,
    ),
    centerTitle: true,
  );
}

Widget buildAppBarLeading() {
  return IconButton(iconSize: 20,onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new),);
}

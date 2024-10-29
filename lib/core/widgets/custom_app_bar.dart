import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/helpers/extensions.dart';
import 'package:fruits_app/core/helpers/spacing.dart';
import 'package:fruits_app/core/theming/app_colors.dart';

import '../theming/text_styles.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
  return AppBar(
    leading: buildAppBarLeading(context),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.font19Bold,
    ),
    centerTitle: true,
  );
}

Widget buildAppBarLeading(BuildContext context) {
  return IconButton(iconSize: 20,onPressed: () {
    context.pop();
  }, icon: Icon(Icons.arrow_back_ios_new),);
}

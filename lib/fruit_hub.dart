import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_router.dart';
import 'package:fruits_app/core/theming/app_colors.dart';
import 'core/helpers/context_provider.dart';
import 'core/routing/routes.dart';
import 'core/services/get_it_service.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FruitHub extends StatelessWidget {
  final AppRouter appRouter;

  const FruitHub({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale("ar"),

        /// set the theme of the app
        theme: ThemeData(
            fontFamily: "Cairo",
            scaffoldBackgroundColor: AppColors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.white,
            )),
        debugShowCheckedModeBanner: false,
        title: 'Fruits Hub',
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}

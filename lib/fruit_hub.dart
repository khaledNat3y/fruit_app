import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_router.dart';

import 'core/routing/routes.dart';
import 'features/splash/presentation/view/splash_view.dart';

class FruitHub extends StatelessWidget {
  final AppRouter appRouter;
  const FruitHub({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fruits Hub',
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}
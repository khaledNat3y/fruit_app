import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';

import 'core/routing/app_router.dart';
import 'fruit_hub.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init;
  runApp(FruitHub(appRouter: AppRouter(),));
}




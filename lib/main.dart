import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';

import 'core/routing/app_router.dart';
import 'firebase_options.dart';
import 'fruit_hub.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init;

  runApp(FruitHub(appRouter: AppRouter(),));
}




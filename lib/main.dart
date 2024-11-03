import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';

import 'core/helpers/context_provider.dart';
import 'core/routing/app_router.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'firebase_options.dart';
import 'fruit_hub.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init;
  await setupGetIt();
  runApp(FruitHub(appRouter: AppRouter(),));
}




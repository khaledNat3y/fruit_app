import 'package:flutter/material.dart';
import 'package:fruits_app/core/services/data_base_service.dart';
import 'package:fruits_app/core/services/firestore_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../helpers/context_provider.dart';
import 'firebase_auth_service.dart';

final getIt = GetIt.instance;

setupGetIt() {
  ///register
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>((FireStoreService()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
        firebaseAuthService: getIt<FirebaseAuthService>(),
        databaseService: getIt<DatabaseService>()),
  );
}

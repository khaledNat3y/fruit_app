import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/constant/constant.dart';
import 'package:fruits_app/core/errors/custom_exception.dart';
import 'package:fruits_app/core/services/data_base_service.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
import 'package:fruits_app/core/services/shared_preferences_singleton.dart';
import 'package:fruits_app/core/utils/backend_endpoints.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
        required String password,
        required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uid: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
         await getUserData(uid: user.uid);
        saveUserData(user: userEntity);

      } else {
        await addUserData(user: userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity =
      UserModel(name: user.displayName!, email: user.email!, uid: user.uid);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity =
      UserModel(name: user.displayName!, email: user.email!, uid: user.uid);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithApple: ${e.toString()}");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoints.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        documentId: user.uid);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    final userData = await databaseService.getData(
        path: BackendEndpoints.getUserData, documentId: uid);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
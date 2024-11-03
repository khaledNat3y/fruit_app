import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/custom_exception.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String email, required String password, required String name}) async{
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    }catch (e) {
      log("Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}");
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({required String email, required String password}) async{
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    }catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}");
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  
}

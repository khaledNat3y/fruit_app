import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
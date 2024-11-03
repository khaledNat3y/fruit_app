import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SignInCubit(this.authRepo) : super(SignInInitial());

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async{
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(email: email, password: password);
    result.fold((failure) {
      emit(SignInFailure(message: failure.message));
    }, (userEntity) {
      emit(SignInSuccess(userEntity: userEntity));
    });
  }
}

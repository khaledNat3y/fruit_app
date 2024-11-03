import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/custom_exception.dart';

import '../../generated/l10n.dart';
import 'get_it_service.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(S.current.the_password_provided_is_too_weak);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(S.current.account_already_in_use);
      }else if (e.code == 'network-request-failed') {
        throw CustomException(S.current.please_check_your_internet_connection_and_try_again);

      }
      else {
        throw CustomException(S.current.an_error_occurred_while_creating_the_user);
      }
    } catch (e) {
      throw CustomException(S.current.an_error_occurred_while_creating_the_user);
    }
  }

  Future<User> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(S.current.user_not_found_for_that_email);
      } else if (e.code == 'wrong-password') {
        throw CustomException(S.current.wrong_password_or_email_provided_for_that_user);
      }else if(e.code == "network-request-failed")
      {
        throw CustomException(S.current.please_check_your_internet_connection_and_try_again);
      }else {
        print("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      }
    }catch (e) {
      print("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
    }
    throw CustomException(S.current.login_error);
  }
}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list/domain/auth/auth_failure.dart';
import 'package:todo_list/domain/auth/i_auth_facade.dart';
import 'package:todo_list/domain/auth/value_objects.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);
  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getValue();
    final passwordStr = password.getValue();
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: passwordStr);
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return Left(const AuthFailure.emailAlreadyInUse());
      } else return Left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getValue();
    final passwordStr = password.getValue();
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: passwordStr);
      return Right(unit);
    } on PlatformException catch (e) {
      if(e.code == 'INVALID_EMAIL' ||
         e.code == 'WRONG_PASSWORD') {
        return Left(const AuthFailure.invalidEmailAndPassword());
      } else
        return Left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

}
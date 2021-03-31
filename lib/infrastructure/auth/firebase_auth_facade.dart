import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/domain/auth/user.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/domain/auth/auth_failure.dart';
import 'package:todo_list/domain/auth/i_auth_facade.dart';
import 'package:todo_list/domain/auth/value_objects.dart';
import 'firebase_user_mapper.dart';


class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getValue();
    final passwordStr = password.getValue();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: passwordStr);
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return Left(const AuthFailure.emailAlreadyInUse());
      } else
        return Left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    final email = emailAddress.getValue();
    final passwordStr = password.getValue();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: passwordStr);
      return Right(unit);
    } catch (e) {
      print('ERROR ${e.code}');
      if (e.code == 'INVALID_EMAIL' || e.code == 'WRONG_PASSWORD') {
        return Left(const AuthFailure.invalidEmailAndPassword());
      } else
        return Left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken);
      await _firebaseAuth.signInWithCredential(authCredential);
    } on PlatformException {
      return Left(const AuthFailure.serverError());
    }
    return Right(unit);
  }

  @override
  Option<LocalUser> getSignInUser() => optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signOut() =>
      Future.wait([_googleSignIn.signOut(), _firebaseAuth.signOut()]);
}

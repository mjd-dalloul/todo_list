
import 'package:flutter/cupertino.dart';
import 'package:todo_list/domain/auth/auth_failure.dart';
import 'package:todo_list/domain/auth/value_objects.dart';
import 'package:todo_list/domain/auth/user.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthFacade {
  Option<LocalUser> getSignInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
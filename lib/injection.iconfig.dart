// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:todo_list/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/core/firbase_connection/bloc/firebase_connection_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list/infrastructure/auth/firebase_auth_facade.dart';
import 'package:todo_list/domain/auth/i_auth_facade.dart';
import 'package:todo_list/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebase);
  g.registerFactory<FirebaseConnectionBloc>(() => FirebaseConnectionBloc());
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerFactory<IAuthFacade>(
      () => FirebaseAuthFacade(g<FirebaseAuth>(), g<GoogleSignIn>()));
  g.registerFactory<SignInFormBloc>(() => SignInFormBloc(g<IAuthFacade>()));
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

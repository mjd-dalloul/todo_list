
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list/application/notes/note_actor/note_actor_bloc.dart';
import 'package:todo_list/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:todo_list/domain/notes/i_note_repository.dart';
import 'package:todo_list/infrastructure/notes/note_repository.dart';

import 'application/auth/bloc/auth_bloc.dart';
import 'application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'domain/auth/i_auth_facade.dart';
import 'infrastructure/auth/firebase_auth_facade.dart';

final GetIt sl = GetIt.instance;

void configureInjection() {
  sl.registerLazySingleton<FirebaseAuth>(
          () => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(
          () => GoogleSignIn());
  sl.registerLazySingleton<INoteRepository>(
          () => NoteRepository(sl()));
  sl.registerFactory<IAuthFacade>(
          () => FirebaseAuthFacade(sl<FirebaseAuth>(), sl<GoogleSignIn>()));
  sl.registerFactory<SignInFormBloc>(() => SignInFormBloc(sl<IAuthFacade>()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl<IAuthFacade>()));
  sl.registerFactory(() => NoteWatcherBloc(sl()));
  sl.registerFactory(() => NoteActorBloc(sl()));
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/auth/i_auth_facade.dart';
import 'package:todo_list/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_list/domain/auth/auth_failure.dart';

part 'sign_in_form_bloc.freezed.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade authFacade;

  SignInFormBloc(this.authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
        emailChanged: (e) async* {
          yield state.copyWith(
              emailAddress: EmailAddress(e.email),
              authFailureOrSuccessOption: none());
        },

        passwordChanged: (e) async* {
          yield state.copyWith(
              password: Password(e.password),
              authFailureOrSuccessOption: none());
        },
        registerWithEmailAndPassword: (e) async* {
          yield* _performActionOnAuthFacadeWithEmailAndPassword(authFacade.registerWithEmailAndPassword);
        },
        signInWithEmailAndPassword: (e) async* {
          yield* _performActionOnAuthFacadeWithEmailAndPassword(authFacade.signInWithEmailAndPassword);
        },
        singInWithGmail: (e) async* {
          yield state.copyWith(
              isSubmitting: true, authFailureOrSuccessOption: none());
          final failureOrSuccess = await authFacade.signInWithGoogle();
          yield state.copyWith(
            isSubmitting: false, authFailureOrSuccessOption: some(failureOrSuccess),
          );
        });
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress emailAddress,
      @required Password password,
    })
        callback,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      failureOrSuccess = await callback(
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}

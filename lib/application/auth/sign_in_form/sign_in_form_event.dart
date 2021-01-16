part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent  with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String email) = EmailChanged;
  const factory SignInFormEvent.passwordChanged(String password) = PassowrdChanged;
  const factory SignInFormEvent.registerWithEmailAndPassword() = RegisterWithEmailAndPassword;
  const factory SignInFormEvent.signInWithEmailAndPassword() = SignInWithEmailAndPassword;
  const factory SignInFormEvent.singInWithGmail() = SignInWithGmail;
}
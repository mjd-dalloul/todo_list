// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'sign_in_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$SignInFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result registerWithEmailAndPassword(),
    @required Result signInWithEmailAndPassword(),
    @required Result singInWithGmail(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result registerWithEmailAndPassword(),
    Result signInWithEmailAndPassword(),
    Result singInWithGmail(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PassowrdChanged value),
    @required
        Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    @required
        Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    @required Result singInWithGmail(SignInWithGmail value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PassowrdChanged value),
    Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    Result singInWithGmail(SignInWithGmail value),
    @required Result orElse(),
  });
}

class _$SignInFormEventTearOff {
  const _$SignInFormEventTearOff();

  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

  PassowrdChanged passwordChanged(String password) {
    return PassowrdChanged(
      password,
    );
  }

  RegisterWithEmailAndPassword registerWithEmailAndPassword() {
    return const RegisterWithEmailAndPassword();
  }

  SignInWithEmailAndPassword signInWithEmailAndPassword() {
    return const SignInWithEmailAndPassword();
  }

  SignInWithGmail singInWithGmail() {
    return const SignInWithGmail();
  }
}

const $SignInFormEvent = _$SignInFormEventTearOff();

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInFormEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$EmailChanged copyWith({
    Object email = freezed,
  }) {
    return _$EmailChanged(
      email == freezed ? this.email : email as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result registerWithEmailAndPassword(),
    @required Result signInWithEmailAndPassword(),
    @required Result singInWithGmail(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result registerWithEmailAndPassword(),
    Result signInWithEmailAndPassword(),
    Result singInWithGmail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PassowrdChanged value),
    @required
        Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    @required
        Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    @required Result singInWithGmail(SignInWithGmail value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PassowrdChanged value),
    Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    Result singInWithGmail(SignInWithGmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements SignInFormEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email;

  EmailChanged copyWith({String email});
}

class _$PassowrdChanged implements PassowrdChanged {
  const _$PassowrdChanged(this.password) : assert(password != null);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInFormEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PassowrdChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  _$PassowrdChanged copyWith({
    Object password = freezed,
  }) {
    return _$PassowrdChanged(
      password == freezed ? this.password : password as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result registerWithEmailAndPassword(),
    @required Result signInWithEmailAndPassword(),
    @required Result singInWithGmail(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result registerWithEmailAndPassword(),
    Result signInWithEmailAndPassword(),
    Result singInWithGmail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PassowrdChanged value),
    @required
        Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    @required
        Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    @required Result singInWithGmail(SignInWithGmail value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PassowrdChanged value),
    Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    Result singInWithGmail(SignInWithGmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PassowrdChanged implements SignInFormEvent {
  const factory PassowrdChanged(String password) = _$PassowrdChanged;

  String get password;

  PassowrdChanged copyWith({String password});
}

class _$RegisterWithEmailAndPassword implements RegisterWithEmailAndPassword {
  const _$RegisterWithEmailAndPassword();

  @override
  String toString() {
    return 'SignInFormEvent.registerWithEmailAndPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegisterWithEmailAndPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result registerWithEmailAndPassword(),
    @required Result signInWithEmailAndPassword(),
    @required Result singInWithGmail(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return registerWithEmailAndPassword();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result registerWithEmailAndPassword(),
    Result signInWithEmailAndPassword(),
    Result singInWithGmail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPassword != null) {
      return registerWithEmailAndPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PassowrdChanged value),
    @required
        Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    @required
        Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    @required Result singInWithGmail(SignInWithGmail value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return registerWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PassowrdChanged value),
    Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    Result singInWithGmail(SignInWithGmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerWithEmailAndPassword != null) {
      return registerWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class RegisterWithEmailAndPassword implements SignInFormEvent {
  const factory RegisterWithEmailAndPassword() = _$RegisterWithEmailAndPassword;
}

class _$SignInWithEmailAndPassword implements SignInWithEmailAndPassword {
  const _$SignInWithEmailAndPassword();

  @override
  String toString() {
    return 'SignInFormEvent.signInWithEmailAndPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignInWithEmailAndPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result registerWithEmailAndPassword(),
    @required Result signInWithEmailAndPassword(),
    @required Result singInWithGmail(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return signInWithEmailAndPassword();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result registerWithEmailAndPassword(),
    Result signInWithEmailAndPassword(),
    Result singInWithGmail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PassowrdChanged value),
    @required
        Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    @required
        Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    @required Result singInWithGmail(SignInWithGmail value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return signInWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PassowrdChanged value),
    Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    Result singInWithGmail(SignInWithGmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class SignInWithEmailAndPassword implements SignInFormEvent {
  const factory SignInWithEmailAndPassword() = _$SignInWithEmailAndPassword;
}

class _$SignInWithGmail implements SignInWithGmail {
  const _$SignInWithGmail();

  @override
  String toString() {
    return 'SignInFormEvent.singInWithGmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignInWithGmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result registerWithEmailAndPassword(),
    @required Result signInWithEmailAndPassword(),
    @required Result singInWithGmail(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return singInWithGmail();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result registerWithEmailAndPassword(),
    Result signInWithEmailAndPassword(),
    Result singInWithGmail(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (singInWithGmail != null) {
      return singInWithGmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result passwordChanged(PassowrdChanged value),
    @required
        Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    @required
        Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    @required Result singInWithGmail(SignInWithGmail value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(registerWithEmailAndPassword != null);
    assert(signInWithEmailAndPassword != null);
    assert(singInWithGmail != null);
    return singInWithGmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result passwordChanged(PassowrdChanged value),
    Result registerWithEmailAndPassword(RegisterWithEmailAndPassword value),
    Result signInWithEmailAndPassword(SignInWithEmailAndPassword value),
    Result singInWithGmail(SignInWithGmail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (singInWithGmail != null) {
      return singInWithGmail(this);
    }
    return orElse();
  }
}

abstract class SignInWithGmail implements SignInFormEvent {
  const factory SignInWithGmail() = _$SignInWithGmail;
}

mixin _$SignInFormState {
  EmailAddress get emailAddress;
  Password get password;
  bool get showErrorMessages;
  bool get isSubmitting;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;

  SignInFormState copyWith(
      {EmailAddress emailAddress,
      Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

  _SignInFormState call(
      {@required EmailAddress emailAddress,
      @required Password password,
      @required bool showErrorMessages,
      @required bool isSubmitting,
      @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) {
    return _SignInFormState(
      emailAddress: emailAddress,
      password: password,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

const $SignInFormState = _$SignInFormStateTearOff();

class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState(
      {@required this.emailAddress,
      @required this.password,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.authFailureOrSuccessOption})
      : assert(emailAddress != null),
        assert(password != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(authFailureOrSuccessOption != null);

  @override
  final EmailAddress emailAddress;
  @override
  final Password password;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignInFormState(emailAddress: $emailAddress, password: $password, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInFormState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @override
  _$_SignInFormState copyWith({
    Object emailAddress = freezed,
    Object password = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _$_SignInFormState(
      emailAddress: emailAddress == freezed
          ? this.emailAddress
          : emailAddress as EmailAddress,
      password: password == freezed ? this.password : password as Password,
      showErrorMessages: showErrorMessages == freezed
          ? this.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? this.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    );
  }
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
          {@required
              EmailAddress emailAddress,
          @required
              Password password,
          @required
              bool showErrorMessages,
          @required
              bool isSubmitting,
          @required
              Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) =
      _$_SignInFormState;

  @override
  EmailAddress get emailAddress;
  @override
  Password get password;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;

  @override
  _SignInFormState copyWith(
      {EmailAddress emailAddress,
      Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

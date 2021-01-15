import 'package:dartz/dartz.dart';

import 'failures/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  return RegExp(emailRegex).hasMatch(input) ? right(input) : left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  return input.length > 6 ? right(input) : left(ValueFailure.shortPassword(failedValue: 'short password'));
}
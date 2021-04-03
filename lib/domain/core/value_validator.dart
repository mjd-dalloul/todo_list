import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

import 'failures/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  return RegExp(emailRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  return input.length > 6
      ? right(input)
      : left(ValueFailure.shortPassword(failedValue: 'short password'));
}

Either<ValueFailure<String>, String> validateMaxStringLength(
    String input, int maxLength) {
  return input.length <= maxLength
      ? right(input)
      : left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
}
Either<ValueFailure<String>, String> validateStringNotEmpty(
    String input) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}
Either<ValueFailure<String>, String> validateSingleLine(
    String input) {
  return !input.contains('\n')
      ? right(input)
      : left(ValueFailure.multiline(failedValue: input ));
}
Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
    KtList<T> input,
    int maxLength) {
  return input.size <= maxLength
      ? right(input)
      : left(ValueFailure.listTooLong(failedValue: input, max: maxLength));
}
import 'package:dartz/dartz.dart';
import 'package:todo_list/domain/core/failures/failures.dart';
import 'package:todo_list/domain/core/value_object.dart';
import 'package:todo_list/domain/core/value_validator.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  const EmailAddress._(this.value);

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
}
class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }
}
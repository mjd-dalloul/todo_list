import 'package:dartz/dartz.dart';
import 'package:todo_list/domain/core/failures/failures.dart';
import 'package:todo_list/domain/core/value_object.dart';
import 'package:todo_list/domain/core/value_validator.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  const EmailAddress._(this.value);

  /// every time user change the email while his writing we modify current
  /// value and validate the input
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
}
class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  const Password._(this.value);

  /// every time user change the password while his writing we modify current
  /// value and validate the input
  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }
}
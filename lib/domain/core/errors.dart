import 'package:todo_list/domain/core/failures/failures.dart';

class UnexpectedError extends Error {
  final ValueFailure failure;
  UnexpectedError(this.failure);
}
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'errors.dart';
import 'failures/failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  /// Called in infrastructure layer if there is an exception
  /// then something went wrong in previous layers
  T getValue() => value.fold((f) => throw UnexpectedError(f), (r) => r);

  /// Dynamic to make a chen of checks for entities (entities may have more
  /// than one value object and every object value has a different type of
  /// data so we need to make a chen of checks)
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit =>
      value.fold((f) => left(f), (r) => right(unit));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const UniqueId._(this.value);

  factory UniqueId() {
    return UniqueId._(right(Uuid().v1()));
  }

  /// get a value object from id coming from back-end
  factory UniqueId.fromUniqueString(String id) => UniqueId._(right(id));
}

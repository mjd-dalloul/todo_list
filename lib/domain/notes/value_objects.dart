import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_list/domain/core/failures/failures.dart';
import 'package:todo_list/domain/core/value_object.dart';
import 'package:todo_list/domain/core/value_transformers.dart';
import 'package:todo_list/domain/core/value_validator.dart';

class NoteBody extends ValueObject<String> {
  static const maxLength = 1000;

  @override
  final Either<ValueFailure<String>, String> value;

  factory NoteBody(String input) => NoteBody._(
        validateMaxStringLength(input, maxLength)
            .flatMap(validateStringNotEmpty),
      );

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  static const maxLength = 30;

  @override
  final Either<ValueFailure<String>, String> value;

  factory TodoName(String input) => TodoName._(
        validateMaxStringLength(input, maxLength)
            .flatMap(validateStringNotEmpty)
            .flatMap(validateSingleLine),
      );

  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa),
    Color(0xfffa8072),
    Color(0xfffedc56),
    Color(0xffd0f0c0),
    Color(0xfffca3b7),
    Color(0xff997950),
    Color(0xfffffdd0),
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  factory NoteColor(Color input) => NoteColor._(right(makeColorOpaque(input)));

  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  static const maxLength = 3;

  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  factory List3(KtList<T> input) => List3._(
        validateMaxListLength(input, maxLength),
      );

  const List3._(this.value);

  int get length => value.getOrElse(() => emptyList()).size;
  bool get isFull => length == maxLength;
}

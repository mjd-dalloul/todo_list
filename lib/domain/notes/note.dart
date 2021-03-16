import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_list/domain/core/failures/failures.dart';
import 'package:todo_list/domain/core/value_object.dart';
import 'package:todo_list/domain/notes/todo_item.dart';
import 'package:todo_list/domain/notes/value_objects.dart';

part 'note.freezed.dart';

@freezed
abstract class Note with _$Note {
  const Note._();

  const factory Note({
    @required UniqueId id,
    @required NoteBody body,
    @required NoteColor color,
    @required List3<TodoItem> todoList,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todoList: List3(emptyList()),
      );

  /// like in todoItem chen of checks for value objects in note entity
  /// entity can have another entity, explain this validation
  /// function andThen take a Either type fold it and return left or right
  /// if left is return break the chen if not return the right and continue
  /// check for body then for todoList then map each item in todoList
  /// to his failureOption and make a list of (some or none) if there is
  /// at least one some then there is a failure in this entity
  Option<ValueFailure<dynamic>> get failureOption => body.failureOrUnit
      .andThen(todoList.failureOrUnit)
      .andThen(todoList
          .getValue()
          .map((item) => item.failureOption)
          .filter((a) => a.isSome())
          .getOrElse(0, (_) => none())
          .fold(() => right(unit), (f) => left(f)))
      .fold((f) => some(f), (_) => none());
}

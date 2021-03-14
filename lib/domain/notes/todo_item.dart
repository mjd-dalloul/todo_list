import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/core/failures/failures.dart';
import 'package:todo_list/domain/core/value_object.dart';
import 'package:todo_list/domain/notes/value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem with _$TodoItem {
  const TodoItem._();

  const factory TodoItem(
      {@required UniqueId id,
      @required TodoName name,
      @required bool done}) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption =>
      name.value.fold((f) => some(f), (_) => none());
}

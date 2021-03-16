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

  /// value type is Either we fold it since the return type is Option
  /// so the return will "some(value)" or "none = void",
  /// we need to know if there is an failure if there is a failure
  /// we return some(failure) if no failure we return none
  /// please be aware that todoItem is an entity so we do not use
  /// isValid on every value object we use this approach (clean code)
  /// another example of chen the value objects in note entity
  Option<ValueFailure<dynamic>> get failureOption =>
      name.value.fold((f) => some(f), (_) => none());
}

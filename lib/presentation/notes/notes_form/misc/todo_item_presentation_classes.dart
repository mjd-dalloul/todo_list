import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_list/domain/core/value_object.dart';
import 'package:todo_list/domain/notes/todo_item.dart';
import 'package:todo_list/domain/notes/value_objects.dart';

part 'todo_item_presentation_classes.freezed.dart';
class FormTodos extends ValueNotifier<KtList<TodoItemPrimitive>> {
  FormTodos() : super(emptyList<TodoItemPrimitive>());
}

@freezed
abstract class TodoItemPrimitive with _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    @required UniqueId id,
    @required String name,
    @required bool done,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: '',
        done: false,
      );
  factory TodoItemPrimitive.fromDomain(TodoItem todoItem) =>
      TodoItemPrimitive(
        id: todoItem.id,
        name: todoItem.name.getValue(),
        done: todoItem.done,
      );

  TodoItem toDomain() =>
      TodoItem(
        id: (id),
        name: TodoName(name),
        done: done,
      );

}

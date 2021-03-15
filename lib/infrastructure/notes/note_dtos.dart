import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/core/value_object.dart';
import 'package:todo_list/domain/notes/note.dart';
import 'package:todo_list/domain/notes/todo_item.dart';
import 'package:todo_list/domain/notes/value_objects.dart';
import 'package:kt_dart/kt.dart';

part 'note_dtos.freezed.dart';

part 'note_dtos.g.dart';

@freezed
abstract class NoteDto with _$NoteDto {
  const NoteDto._();

  const factory NoteDto({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<TodoItemDto> todoList,
    @required
    @ServerTimestampConverter()
        FieldValue serverTimeStamp, // for note register time
  }) = _NoteDto;

  factory NoteDto.fromDomain(Note note) => NoteDto(
        body: note.body.getValue(),
        color: note.color.getValue().value,
        todoList: note.todoList
            .getValue()
            .map((todoItem) => TodoItemDto.fromDomain(todoItem))
            .asList(),
        serverTimeStamp: FieldValue.serverTimestamp(),
      );

  Note toDomain() => Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      todoList: List3(
          todoList.map((todoItem) => todoItem.toDomain()).toImmutableList()),
      color: NoteColor(Color(color)));

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFireStore(DocumentSnapshot doc) =>
      NoteDto.fromJson(doc.data()).copyWith(id: doc.id);
}

@freezed
abstract class TodoItemDto with _$TodoItemDto {
  const TodoItemDto._();

  const factory TodoItemDto({
    @required String id,
    @required String name,
    @required bool done,
  }) = _TodoItemDto;

  factory TodoItemDto.fromDomain(TodoItem todoItem) => TodoItemDto(
        id: todoItem.id.getValue(),
        name: todoItem.name.getValue(),
        done: todoItem.done,
      );

  TodoItem toDomain() => TodoItem(
        id: UniqueId.fromUniqueString(id),
        name: TodoName(name),
        done: done,
      );

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

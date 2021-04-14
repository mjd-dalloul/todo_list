import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_list/application/notes/note_form/note_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/notes/notes_form/misc/todo_item_presentation_classes.dart';
import 'package:todo_list/presentation/notes/notes_form/misc/build_context_x.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (p, c) => p.isEditing != c.isEditing,
        listener: (context, state) {
          context.formTodos = (state.note.todoList.value.fold(
            (f) => listOf<TodoItemPrimitive>(),
            (todoItemList) =>
                todoItemList.map((_) => TodoItemPrimitive.fromDomain(_)),
          ));
        },
        builder: (context, state) {
          return ListTile(
            enabled: !state.note.todoList.isFull,
            title: const Text('Add a todo'),
            leading: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.add),
            ),
            onTap: () {
              context.formTodos =
                  context.formTodos.plusElement(TodoItemPrimitive.empty());
              context.read<NoteFormBloc>().add(
                    NoteFormEvent.todosChanged(context.formTodos),
                  );
            },
          );
        });
  }
}

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/application/notes/note_form/note_form_bloc.dart';
import 'package:todo_list/presentation/notes/notes_form/misc/todo_item_presentation_classes.dart';
import 'package:todo_list/presentation/notes/notes_form/misc/build_context_x.dart';
import 'package:kt_dart/kt.dart';

class TodoList extends StatelessWidget {
  const TodoList();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.note.todoList.isFull != c.note.todoList.isFull,
      listener: (context, state) {
        if (state.note.todoList.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer Lists? Active premium',
            button: FlatButton(
              onPressed: () {},
              child: const Text(
                'BUT NOW',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => TodoTile(index: index),
            itemCount: formTodos.value.size,
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({@required this.index});

  @override
  Widget build(BuildContext context) {
    final todoItemPrimitive =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    return ListTile(
      leading: Checkbox(
        value: todoItemPrimitive.done,
        onChanged: (value) {
          context.formTodos = context.formTodos.map(
            (listTodo) => listTodo == todoItemPrimitive
                ? todoItemPrimitive.copyWith(done: value)
                : listTodo,
          );
          context.read<NoteFormBloc>().add(NoteFormEvent.todosChanged(context.formTodos));
        },
      ),
    );
  }
}

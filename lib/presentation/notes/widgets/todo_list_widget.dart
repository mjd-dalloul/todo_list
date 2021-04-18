import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/application/notes/note_form/note_form_bloc.dart';
import 'package:todo_list/domain/notes/value_objects.dart';
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
          return ImplicitlyAnimatedReorderableList<TodoItemPrimitive>(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            removeDuration: const Duration(),
            items: formTodos.value.asList(),
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            onReorderFinished: (item, from, to, newItem) {
              context.formTodos = newItem.toImmutableList();
              context
                  .read<NoteFormBloc>()
                  .add(NoteFormEvent.todosChanged(context.formTodos));
            },
            itemBuilder: (context, itemAnimation, item, index) => Reorderable(
              key: ValueKey(item.id),
              builder: (context, animation, inDrag) {
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 1,
                    end: .95,
                  ).animate(animation),
                  child: TodoTile(
                    index: index,
                    elevation: animation.value * 4,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;
  final double elevation;

  const TodoTile({
    @required this.index,
    double elevation,
    Key key,
  })  : elevation = elevation ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoItemPrimitive =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    final todoController =
        useTextEditingController(text: todoItemPrimitive.name);
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: .19,
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete,
          color: Colors.red,
          onTap: () {
            context.formTodos =
                context.formTodos.minusElement(todoItemPrimitive);
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Material(
          elevation: elevation,
          animationDuration: const Duration(milliseconds: 50),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Checkbox(
                value: todoItemPrimitive.done,
                onChanged: (value) {
                  context.formTodos = context.formTodos.map(
                    (listTodo) => listTodo == todoItemPrimitive
                        ? todoItemPrimitive.copyWith(done: value)
                        : listTodo,
                  );
                  context
                      .read<NoteFormBloc>()
                      .add(NoteFormEvent.todosChanged(context.formTodos));
                },
              ),
              title: TextFormField(
                autovalidateMode:
                    context.read<NoteFormBloc>().state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                controller: todoController,
                decoration: InputDecoration(
                  hintText: 'Todo',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: TodoName.maxLength,
                onChanged: (value) {
                  context.formTodos = context.formTodos.map(
                    (listTodo) => listTodo == todoItemPrimitive
                        ? todoItemPrimitive.copyWith(name: value)
                        : listTodo,
                  );
                  context
                      .read<NoteFormBloc>()
                      .add(NoteFormEvent.todosChanged(context.formTodos));
                },
                validator: (_) => context
                    .read<NoteFormBloc>()
                    .state
                    .note
                    .todoList
                    .value
                    .fold(
                      (f) => null,
                      (todoList) => todoList[index].name.value.fold(
                            (f) => f.maybeMap(
                              empty: (_) => 'Cannot be empty',
                              exceedingLength: (_) => 'Too long',
                              multiline: (_) => 'Has to be in a single line',
                              orElse: () => 'ELSE',
                            ),
                            (_) => null,
                          ),
                    ),
              ),
              trailing: const Handle(
                child: Icon(Icons.list),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

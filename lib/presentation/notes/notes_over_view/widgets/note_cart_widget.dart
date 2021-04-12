import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/notes/note_actor/note_actor_bloc.dart';
import 'package:todo_list/domain/notes/note.dart';
import 'package:kt_dart/kt.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_list/domain/notes/todo_item.dart';
import 'package:todo_list/presentation/routes/router.gr.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    @required this.note,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getValue(),
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context).pushNoteFormPage(editedNote: note);
        },
        onLongPress: () {
          _showDeletionDialog(
            context,
            context.read<NoteActorBloc>(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.body.getValue(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              if (note.todoList.length > 0) ...[
                const SizedBox(
                  height: 4,
                ),
                Wrap(
                  spacing: 8.0,
                  children: [
                    ...note.todoList
                        .getValue()
                        .map((item) => TodoDisplay(todo: item))
                        .iter,
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showDeletionDialog(BuildContext context, NoteActorBloc noteActorBloc) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Selected note:'),
            content: Text(
              note.body.getValue(),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('CANCEL'),
              ),
              FlatButton(
                onPressed: () {
                  noteActorBloc.add(NoteActorEvent.deleted(note));
                  Navigator.of(context).pop();
                },
                child: const Text('DELETE'),
              ),
            ],
          );
        });
  }
}

class TodoDisplay extends StatelessWidget {
  final TodoItem todo;

  const TodoDisplay({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (todo.done)
          Icon(
            Icons.check_box,
            color: Theme.of(context).accentColor,
          ),
        if (!todo.done)
          Icon(
            Icons.check_box_outline_blank,
            color: Theme.of(context).disabledColor,
          ),
        Text(todo.name.getValue()),
      ],
    );
  }
}

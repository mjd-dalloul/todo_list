import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/notes/note_watcher/note_watcher_bloc.dart';

class NotesOverViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
        builder: (context, state) {
      return state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const Center(
          child: const CircularProgressIndicator(),
        ),
        loadSuccess: (state) {
          return ListView.builder(
            itemCount: state.notes.size,
            itemBuilder: (context, index) {
              final note = state.notes[index];
              if (note.failureOption.isSome()) {
                return Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                );
              } else {
                return Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                );
              }
            },
          );
        },
        loadFailure: (state) {
          return Container(
            color: Colors.yellow,
            width: 200,
            height: 200,
          );
        },
      );
    });
  }
}

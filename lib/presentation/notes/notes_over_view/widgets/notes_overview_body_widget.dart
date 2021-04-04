import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:todo_list/presentation/notes/notes_over_view/widgets/critical_failure_display.dart';
import 'package:todo_list/presentation/notes/notes_over_view/widgets/note_cart_widget.dart';

import 'error_note_card.dart';

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
                return ErrorNoteCard(
                  note: note,
                );
              } else {
                return NoteCard(
                  note: note,
                );
              }
            },
          );
        },
        loadFailure: (state) {
          return CriticalFailureDisplay(
            failure: state.noteFailure,
          );
        },
      );
    });
  }
}

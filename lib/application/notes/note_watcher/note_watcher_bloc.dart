import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_list/domain/notes/i_note_repository.dart';
import 'package:todo_list/domain/notes/note.dart';
import 'package:todo_list/domain/notes/note_failure.dart';

part 'note_watcher_event.dart';

part 'note_watcher_state.dart';

part 'note_watcher_bloc.freezed.dart';

class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository noteRepository;

  StreamSubscription<Either<NoteFailure, KtList<Note>>> noteStreamSubscription;

  NoteWatcherBloc(this.noteRepository)
      : super(const NoteWatcherState.initial());

  @override
  Stream<NoteWatcherState> mapEventToState(
    NoteWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const NoteWatcherState.loadInProgress();
        await noteStreamSubscription?.cancel();
        noteStreamSubscription = noteRepository.watchAll().listen(
              (failureOrNotes) => add(
                NoteWatcherEvent.notesReceived(failureOrNotes),
              ),
            );
      },
      watchUncompletedStarted: (e) async* {
        yield const NoteWatcherState.loadInProgress();
        await noteStreamSubscription?.cancel();
        noteStreamSubscription = noteRepository.watchUncompleted().listen(
              (failureOrNotes) => add(
            NoteWatcherEvent.notesReceived(failureOrNotes),
          ),
        );
      },
      notesReceived: (e) async* {
        print('data arrive');
        yield e.failureOrNotes.fold(
          (f) {
            print(f);
            return NoteWatcherState.loadFailure(f);
          } ,
          (notes) {
            print(notes.size);
            return NoteWatcherState.loadSuccess(notes);
        }
        );
      },
    );
  }
  @override
  Future<void> close() async {
    await noteStreamSubscription.cancel();
    return super.close();
  }
}

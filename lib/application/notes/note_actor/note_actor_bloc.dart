import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/domain/notes/i_note_repository.dart';
import 'package:todo_list/domain/notes/note.dart';
import 'package:todo_list/domain/notes/note_failure.dart';

part 'note_actor_event.dart';

part 'note_actor_state.dart';

part 'note_actor_bloc.freezed.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository noteRepository;

  NoteActorBloc(this.noteRepository) : super(const NoteActorState.initial());

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    yield const NoteActorState.actionInProgress();
    final possibleFailure = await noteRepository.delete(event.note);
    yield possibleFailure.fold(
      (f) => NoteActorState.deleteFailure(f),
      (_) => const NoteActorState.deleteSuccess(),
    );
  }
}

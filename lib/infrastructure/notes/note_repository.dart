import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:kt_dart/kt.dart';
import 'package:todo_list/domain/notes/i_note_repository.dart';
import 'package:todo_list/domain/notes/note.dart';
import 'package:todo_list/domain/notes/note_failure.dart';
import 'package:todo_list/infrastructure/core/firestore_helpers.dart';
import 'package:todo_list/infrastructure/notes/note_dtos.dart';
import 'package:rxdart/rxdart.dart';

class NoteRepository implements INoteRepository {
  final FirebaseFirestore fireStore;

  NoteRepository(this.fireStore);

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    final userDoc = await fireStore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right(
            snapshot.docs
                .map((doc) => NoteDto.fromFireStore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith(
      (error) {
        if (error is PlatformException &&
            error.message.contains('PERMISSION_DENIED')) {
          return left(const NoteFailure.insufficientPermission());
        } else {
          return left(const NoteFailure.unexpected());
        }
      },
    );
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await fireStore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => (snapshot.docs
              .map((doc) => NoteDto.fromFireStore(doc).toDomain())),
        )
        .map((notes) => right<NoteFailure, KtList<Note>>(notes
            .where((note) =>
                note.todoList.getValue().any((todoItem) => !todoItem.done))
            .toImmutableList()))
        .onErrorReturnWith(
      (error) {
        if (error is PlatformException &&
            error.message.contains('PERMISSION_DENIED')) {
          return left(const NoteFailure.insufficientPermission());
        } else {
          return left(const NoteFailure.unexpected());
        }
      },
    );
  }

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

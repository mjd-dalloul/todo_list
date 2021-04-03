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
    print('WATCH ALL');
    final userDoc = await fireStore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
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
          print(error);
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
          (snapshot) => (snapshot.docs.map(
            (doc) => NoteDto.fromFireStore(doc).toDomain(),
          )),
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
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await fireStore.userDocument();
      final noteDto = NoteDto.fromDomain(note);
      await userDoc.noteCollection.doc(noteDto.id).set(noteDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await fireStore.userDocument();
      final noteId = note.id.getValue();
      await userDoc.noteCollection.doc(noteId).delete();
      return right(unit);
    } on PlatformException catch (e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await fireStore.userDocument();
      final noteDto = NoteDto.fromDomain(note);
      await userDoc.noteCollection.doc(noteDto.id).update(noteDto.toJson());
      return right(unit);
    } on PlatformException catch (e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }
}

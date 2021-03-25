import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/domain/auth/i_auth_facade.dart';
import 'package:todo_list/domain/core/errors.dart';
import 'package:todo_list/injection.dart';

extension FireStroeX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = sl<IAuthFacade>().getSignInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getValue());
  }
}
extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
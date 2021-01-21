import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/domain/auth/user.dart';
import 'package:todo_list/domain/core/value_object.dart';

extension FirebaseUserDomainX on User {
  LocalUser toDomain() => LocalUser(id: UniqueId.fromUniqueString(uid));
}

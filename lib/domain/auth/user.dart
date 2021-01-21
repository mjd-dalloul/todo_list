import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/core/value_object.dart';

part 'user.freezed.dart';

@freezed
abstract class LocalUser with _$LocalUser {
  const factory LocalUser({
    @required UniqueId id,
  }) = _LocalUser;
}

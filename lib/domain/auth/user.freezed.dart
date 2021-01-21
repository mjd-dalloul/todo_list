// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$LocalUser {
  UniqueId get id;

  LocalUser copyWith({UniqueId id});
}

class _$LocalUserTearOff {
  const _$LocalUserTearOff();

  _LocalUser call({@required UniqueId id}) {
    return _LocalUser(
      id: id,
    );
  }
}

const $LocalUser = _$LocalUserTearOff();

class _$_LocalUser implements _LocalUser {
  const _$_LocalUser({@required this.id}) : assert(id != null);

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'LocalUser(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocalUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$_LocalUser copyWith({
    Object id = freezed,
  }) {
    return _$_LocalUser(
      id: id == freezed ? this.id : id as UniqueId,
    );
  }
}

abstract class _LocalUser implements LocalUser {
  const factory _LocalUser({@required UniqueId id}) = _$_LocalUser;

  @override
  UniqueId get id;

  @override
  _LocalUser copyWith({UniqueId id});
}

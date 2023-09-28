// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthStates {
  bool get hasRegistered => throw _privateConstructorUsedError;
  bool get isLoadingActivated => throw _privateConstructorUsedError;
  models.User? get currentUser => throw _privateConstructorUsedError;
  AsyncValue<AuthEnumState> get userAuthenticatingStage =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStatesCopyWith<AuthStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatesCopyWith<$Res> {
  factory $AuthStatesCopyWith(
          AuthStates value, $Res Function(AuthStates) then) =
      _$AuthStatesCopyWithImpl<$Res, AuthStates>;
  @useResult
  $Res call(
      {bool hasRegistered,
      bool isLoadingActivated,
      models.User? currentUser,
      AsyncValue<AuthEnumState> userAuthenticatingStage});
}

/// @nodoc
class _$AuthStatesCopyWithImpl<$Res, $Val extends AuthStates>
    implements $AuthStatesCopyWith<$Res> {
  _$AuthStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasRegistered = null,
    Object? isLoadingActivated = null,
    Object? currentUser = freezed,
    Object? userAuthenticatingStage = null,
  }) {
    return _then(_value.copyWith(
      hasRegistered: null == hasRegistered
          ? _value.hasRegistered
          : hasRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingActivated: null == isLoadingActivated
          ? _value.isLoadingActivated
          : isLoadingActivated // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as models.User?,
      userAuthenticatingStage: null == userAuthenticatingStage
          ? _value.userAuthenticatingStage
          : userAuthenticatingStage // ignore: cast_nullable_to_non_nullable
              as AsyncValue<AuthEnumState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStatesCopyWith<$Res>
    implements $AuthStatesCopyWith<$Res> {
  factory _$$_AuthStatesCopyWith(
          _$_AuthStates value, $Res Function(_$_AuthStates) then) =
      __$$_AuthStatesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasRegistered,
      bool isLoadingActivated,
      models.User? currentUser,
      AsyncValue<AuthEnumState> userAuthenticatingStage});
}

/// @nodoc
class __$$_AuthStatesCopyWithImpl<$Res>
    extends _$AuthStatesCopyWithImpl<$Res, _$_AuthStates>
    implements _$$_AuthStatesCopyWith<$Res> {
  __$$_AuthStatesCopyWithImpl(
      _$_AuthStates _value, $Res Function(_$_AuthStates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasRegistered = null,
    Object? isLoadingActivated = null,
    Object? currentUser = freezed,
    Object? userAuthenticatingStage = null,
  }) {
    return _then(_$_AuthStates(
      hasRegistered: null == hasRegistered
          ? _value.hasRegistered
          : hasRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingActivated: null == isLoadingActivated
          ? _value.isLoadingActivated
          : isLoadingActivated // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as models.User?,
      userAuthenticatingStage: null == userAuthenticatingStage
          ? _value.userAuthenticatingStage
          : userAuthenticatingStage // ignore: cast_nullable_to_non_nullable
              as AsyncValue<AuthEnumState>,
    ));
  }
}

/// @nodoc

class _$_AuthStates extends _AuthStates {
  const _$_AuthStates(
      {this.hasRegistered = false,
      this.isLoadingActivated = false,
      this.currentUser,
      this.userAuthenticatingStage = const AsyncData(AuthEnumState.init)})
      : super._();

  @override
  @JsonKey()
  final bool hasRegistered;
  @override
  @JsonKey()
  final bool isLoadingActivated;
  @override
  final models.User? currentUser;
  @override
  @JsonKey()
  final AsyncValue<AuthEnumState> userAuthenticatingStage;

  @override
  String toString() {
    return 'AuthStates(hasRegistered: $hasRegistered, isLoadingActivated: $isLoadingActivated, currentUser: $currentUser, userAuthenticatingStage: $userAuthenticatingStage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStates &&
            (identical(other.hasRegistered, hasRegistered) ||
                other.hasRegistered == hasRegistered) &&
            (identical(other.isLoadingActivated, isLoadingActivated) ||
                other.isLoadingActivated == isLoadingActivated) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(
                    other.userAuthenticatingStage, userAuthenticatingStage) ||
                other.userAuthenticatingStage == userAuthenticatingStage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasRegistered,
      isLoadingActivated, currentUser, userAuthenticatingStage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStatesCopyWith<_$_AuthStates> get copyWith =>
      __$$_AuthStatesCopyWithImpl<_$_AuthStates>(this, _$identity);
}

abstract class _AuthStates extends AuthStates {
  const factory _AuthStates(
      {final bool hasRegistered,
      final bool isLoadingActivated,
      final models.User? currentUser,
      final AsyncValue<AuthEnumState> userAuthenticatingStage}) = _$_AuthStates;
  const _AuthStates._() : super._();

  @override
  bool get hasRegistered;
  @override
  bool get isLoadingActivated;
  @override
  models.User? get currentUser;
  @override
  AsyncValue<AuthEnumState> get userAuthenticatingStage;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStatesCopyWith<_$_AuthStates> get copyWith =>
      throw _privateConstructorUsedError;
}

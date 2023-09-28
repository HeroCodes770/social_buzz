import 'package:appwrite/models.dart' as models;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.freezed.dart';

@freezed
class AuthStates with _$AuthStates {
  const AuthStates._();

  const factory AuthStates({
    @Default(false) bool hasRegistered,
    @Default(false) bool isLoadingActivated,
    models.User? currentUser,
    @Default(AsyncData(AuthEnumState.init))
    AsyncValue<AuthEnumState> userAuthenticatingStage,
  }) = _AuthStates;

  factory AuthStates.initial() => const AuthStates();
}

enum AuthEnumState { init, loggedIn, otpVerified, loggedOut, registered }

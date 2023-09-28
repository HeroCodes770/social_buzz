import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_buzz/application/auth/auth_states.dart';
import 'package:social_buzz/domain/core/dependency_injection.dart';
import 'package:social_buzz/infrastructure/repo/auth/auth_service.dart';
import 'package:social_buzz/presentation/common/info_alert/snackBars.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthStates>((ref) {
  final authRepositoryImpl = ref.watch(authRepositoryImplProvider);
  return AuthNotifier(authRepositoryImpl: authRepositoryImpl);
});

final getCurrentUser = FutureProvider((ref) {
  final user = ref.watch(authNotifierProvider.notifier);
  return user.getCurrentuser();
});

class AuthNotifier extends StateNotifier<AuthStates> {
  final AuthRepositoryImpl _authRepositoryImpl;
  AuthNotifier({required authRepositoryImpl})
      : _authRepositoryImpl = authRepositoryImpl,
        super(AuthStates.initial());

  Future<void> register({required email, required password}) async {
    state = state.copyWith(isLoadingActivated: true);
    final res =
        await _authRepositoryImpl.register(email: email, password: password);
    state = state.copyWith(isLoadingActivated: false);

    res.fold((failure) {
      state = state.copyWith(
          userAuthenticatingStage: AsyncValue.error(failure, StackTrace.empty));
      SnackBars.failureSnackbar('Account Creation', failure);
    }, (success) {
      state = state.copyWith(
          userAuthenticatingStage:
              const AsyncValue.data(AuthEnumState.registered));
    });
  }

  Future<void> login({required email, required password}) async {
    state = state.copyWith(isLoadingActivated: true);
    final res =
        await _authRepositoryImpl.login(email: email, password: password);
    state = state.copyWith(isLoadingActivated: false);

    res.fold((failure) {
      state = state.copyWith(
          userAuthenticatingStage: AsyncValue.error(failure, StackTrace.empty));
      SnackBars.failureSnackbar('Account Creation', failure);
    }, (success) {
      state = state.copyWith(
          userAuthenticatingStage:
              const AsyncValue.data(AuthEnumState.loggedIn));
    });
  }

  Future<void> getCurrentuser() async =>
      await _authRepositoryImpl.getCurrentUser();
}

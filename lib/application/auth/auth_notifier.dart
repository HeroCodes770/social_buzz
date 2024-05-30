
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:social_buzz/application/auth/auth_states.dart';
import 'package:social_buzz/domain/core/dependency_injection.dart';
import 'package:social_buzz/infrastructure/repo/auth/auth_service.dart';
import 'package:social_buzz/infrastructure/repo/user/model/usermodel.dart';
import 'package:social_buzz/infrastructure/repo/user/userFacadeImpl.dart';
import 'package:social_buzz/presentation/common/info_alert/snackBars.dart';
import 'package:social_buzz/presentation/screens/auth/login/login_screen.dart';

//Auth notifier provider
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthStates>((ref) {
  final authRepositoryImpl = ref.watch(authRepositoryImplProvider);
  final userRepositoryImpl = ref.watch(userRepositoryImplProvider);

  return AuthNotifier(
    authRepositoryImpl: authRepositoryImpl,
    userRepositoryImpl: userRepositoryImpl,
  );
});

//Provider to get current user details from document
final currentDetailsProvider = FutureProvider((ref) async  {
  final currentId =  ref.watch(currentUserAccountProvider).value!.$id;

  final currentDetails = ref.watch(userAccountDetailProvider(currentId));

  return currentDetails.value;
});

//Provider to get user document data
final userAccountDetailProvider = FutureProvider.family((ref, String uid) {
  final authController = ref.watch(authNotifierProvider.notifier);
  return authController.getUserData(uid);
});

//Provider to get current user
final currentUserAccountProvider = FutureProvider((ref) {
  final user = ref.watch(authNotifierProvider.notifier);
  return user.getCurrentuser();
});

class AuthNotifier extends StateNotifier<AuthStates> {
  final AuthRepositoryImpl _authRepositoryImpl;
  final UserRepositoryImpl _userRepositoryImpl;
  AuthNotifier({
    required authRepositoryImpl,
    required userRepositoryImpl,
  })  : _authRepositoryImpl = authRepositoryImpl,
        _userRepositoryImpl = userRepositoryImpl,
        super(AuthStates.initial());

//Register
  Future<void> register({required email, required password}) async {
    state = state.copyWith(isLoadingActivated: true);
    final res =
        await _authRepositoryImpl.register(email: email, password: password);
    state = state.copyWith(isLoadingActivated: false);

    res.fold((failure) {
      state = state.copyWith(
          userAuthenticatingStage: AsyncValue.error(failure, StackTrace.empty));
      SnackBars.failureSnackbar('Account Failure', failure);
    }, (userAccount) async {
      UserModel userModel = UserModel(
        email: userAccount.email,
        name: userAccount.name,
        followers: const [],
        following: const [],
        profilePic: '',
        uid: userAccount.$id,
        bio: '',
        isVerified: false,
      );

      final savedUserDetails =
          await _userRepositoryImpl.saveUserData(userModel);

      savedUserDetails.fold((fail) {
        SnackBars.failureSnackbar(
          'User Details',
          'Failed to save user details',
        );
      }, (user) {
        state = state.copyWith(
            userAuthenticatingStage:
                const AsyncValue.data(AuthEnumState.registered));
      });
    });
  }

//Login
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

  //Get current user
  Future<model.User?> getCurrentuser() async =>
      await _authRepositoryImpl.getCurrentUser();

  //Get user data
  Future<UserModel> getUserData(String uid) async {
    final document = await _userRepositoryImpl.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;
  }

  //Log out user
  Future<dynamic> logOut() async {
    return await _authRepositoryImpl.logOut().then((value) => Get.offAllNamed(LoginScreen.id));
  }
}

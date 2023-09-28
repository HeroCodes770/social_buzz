import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

class AppWriteServices {
  final Account _account;

  AppWriteServices({required Account account}) : _account = account;

  Future register({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return res;
    } on AppwriteException catch (e) {
      log('We are here ${e.toString()}');
      return e.response;
    } catch (e) {
      log(e.toString());
      return;
    }
  }

  Future<models.User> currentUser() async {
    try {
      final res = await _account.get();
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<models.Session> login({required email, required password}) async {
    try {
      final res =
          await _account.createEmailSession(email: email, password: password);
      return res;
    } on AppwriteException catch (e) {
      return e.response;
    } catch (e) {
      rethrow;
    }
  }
}

import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:social_buzz/domain/repo/auth/auth_facade.dart';
import 'package:social_buzz/infrastructure/third_party_service/appwrite_services.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AppWriteServices _appWriteServices;

  AuthRepositoryImpl({required appWriteServices})
      : _appWriteServices = appWriteServices;

  @override
  Future<Either<String, models.Session>> login(
      {required String email, required String  password}) async {
    try {
      final models.Session res = await _appWriteServices.login(
        email: email,
        password: password,
      );
      return right(res);
    } on AppwriteException catch (e) {
    log(e.toString());
      return Left(e.message!);
    } catch (e) {
        log(e.toString());
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, models.User>> register(
      {required String email, required String password}) async {
    try {
      final models.User response =
          await _appWriteServices.register(email: email, password: password);

      return right(response);

    } on AppwriteException catch (e) {
      return Left(e.message!);
    } catch (e) {
     
      return  Left(e.toString());
    }
  }

  @override
  Future< models.User?> getCurrentUser() async {
    try {
      final response = await _appWriteServices.currentUser();

      if (response.email.isNotEmpty) {
        return response;
      } else {
        return null;
      }
    } on AppwriteException catch (e) {
       e;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future logOut()  async {
   final loggedOutUser = await _appWriteServices.logOut();
   return loggedOutUser;
  }
}

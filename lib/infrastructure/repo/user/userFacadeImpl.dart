import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_buzz/domain/core/constants/appwrite_constants.dart';
import 'package:social_buzz/domain/core/dependency_injection.dart';
import 'package:social_buzz/domain/repo/user/user_facade.dart';
import 'package:social_buzz/infrastructure/repo/user/model/usermodel.dart';

final userRepositoryImplProvider = Provider((ref) {
  return UserRepositoryImpl(databases: ref.watch(databaseProvider));
});

class UserRepositoryImpl implements UserRepository {
  final Databases _databases;

  const UserRepositoryImpl({required Databases databases})
      : _databases = databases;
  @override
  Future<Either<String, Unit>> saveUserData(UserModel userModel) async {
    try {
      await _databases.createDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.usersCollectionId,
        documentId: userModel.uid,
        data: userModel.toMap(),
      );

      return const Right(unit);
    } on AppwriteException catch (e) {
      return Left(e.message!);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Document> getUserData(String uid) async {
    try {
      final db = await _databases.getDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.usersCollectionId,
        documentId: uid,
      );
      return db;
    } on AppwriteException catch (e) {
      log('This is the exception getting user data ${e.toString()}');
      rethrow;
    } catch (e) {
       log('This is the exception-catch block getting user data ${e.toString()}');
      rethrow;
    }
  }
}

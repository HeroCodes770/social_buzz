import 'dart:developer';

import 'package:appwrite/appwrite.dart';
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
        documentId: ID.unique(),
        data: userModel.toMap(),
      );

      log('UserModel --> ${userModel.toJson()}');
      return const Right(unit);
    } on AppwriteException catch (e) {
       log('appwrite error --> ${e.toString()}');
      return Left(e.message!);
    } catch (e) {
      log('catch error --> ${e.toString()}');
     return Left(e.toString());
    }
  }
}

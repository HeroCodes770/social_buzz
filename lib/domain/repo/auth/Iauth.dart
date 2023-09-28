import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<String, models.User>> register({
    required email,
    required password,
  });
  Future<Either<String, models.Session>> login({
    required email,
    required password,
  });

Future<Either<String, models.User>> getCurrentUser();

}

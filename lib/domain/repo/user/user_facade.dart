import 'package:dartz/dartz.dart';
import 'package:social_buzz/infrastructure/repo/user/model/usermodel.dart';

abstract class UserRepository{
 Future<Either<String, Unit>> saveUserData(UserModel userModel);
}
import 'package:appwrite/models.dart' as models;
import 'package:dartz/dartz.dart';
import 'package:social_buzz/infrastructure/repo/user/model/usermodel.dart';

abstract class UserRepository{
 Future<Either<String, Unit>> saveUserData(UserModel userModel);

 Future< models.Document> getUserData(String uid);
}
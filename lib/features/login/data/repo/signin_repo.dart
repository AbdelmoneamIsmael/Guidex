import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/user/user_model.dart';


abstract class SigninRepo {
  Future<Either<Failure, UserModel>> login();
}

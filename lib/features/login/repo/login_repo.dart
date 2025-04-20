import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/user/user_info.dart';


abstract class GetUserInfoRepo {
  Future<Either<Failure, UserInfoModel>> getUserInfo();
}
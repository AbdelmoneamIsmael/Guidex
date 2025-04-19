import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/features/login/data/model/login_prameters.dart';
import 'package:guidix/features/login/data/model/login_response.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponse>> login(
      {required LoginPrameters params});
}

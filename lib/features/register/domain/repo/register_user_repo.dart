import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/features/register/domain/entity/register_response.dart';
import 'package:guidix/features/register/domain/entity/register_user_params.dart';

abstract class RegisterUserRepo {
  Future<Either<Failure, RegesterResponseModel>> registerUser({
    required RegesterUserParams regesterUserParams,
  });
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/features/register/data/remote/register_user.dart';
import 'package:guidix/features/register/domain/entity/register_response.dart';
import 'package:guidix/features/register/domain/entity/register_user_params.dart';
import 'package:guidix/features/register/domain/repo/register_user_repo.dart';

class RegisterRepoImple extends RegisterUserRepo {
  final RegisterUserRemote registerUserRemote;

  RegisterRepoImple({required this.registerUserRemote});
  @override
  Future<Either<Failure, RegesterResponseModel>> registerUser(
      {required RegesterUserParams regesterUserParams}) async {
    try {
      final results = await registerUserRemote.registerUser(
          regesterUserParams: regesterUserParams);

      return Right(results);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

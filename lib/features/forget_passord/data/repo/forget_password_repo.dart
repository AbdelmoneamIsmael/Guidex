import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/features/forget_passord/data/remote/change_password.dart';
import 'package:guidix/features/forget_passord/data/remote/remote_confirm_email.dart';

class ForgetPasswordRepo {
  final RemoteChangePassword remoteChangePassword;
  final RemoteConfirmEmail remoteConfirmEmail;
  
  ForgetPasswordRepo(
      {required this.remoteChangePassword, required this.remoteConfirmEmail});

  Future<Either<Failure, BasicResponseModel>> confirmEmail(
      {required String email}) async {
    try {
      var result = await remoteConfirmEmail.confirmEmail(email: email);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(
            code: internalLocalError,
            message: e.toString(),
          ),
        );
      }
    }
  }

  Future<Either<Failure, BasicResponseModel>> changePassword(
      {required Map<String, dynamic> data}) async {
    try {
      var result = await remoteChangePassword.changePassword(data: data);
      return Right(result);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
          ServerFailure(
            code: internalLocalError,
            message: e.toString(),
          ),
        );
      }
    }
  }
}

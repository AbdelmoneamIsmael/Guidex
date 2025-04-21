import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/models/user/user_model.dart';
import 'package:guidix/features/confirm_otp/data/datasources/remote/confirm_otp.dart';
import 'package:guidix/features/confirm_otp/data/datasources/remote/send_otp.dart';
import 'package:guidix/features/confirm_otp/domain/repositories/confirm_otp_repo.dart';

class ConfirmOtpRepoImple extends ConfirmOtpRepo {
  final RemoteConfirmOtp remoteConfirmOtp;
  final RemoteSendOtp remoteSendOtp;

  ConfirmOtpRepoImple(
      {required this.remoteConfirmOtp, required this.remoteSendOtp});
  @override
  Future<Either<Failure, BasicResponseModel>> sendOtp(
      {required String email}) async {
    try {
      var result = await remoteSendOtp.call(email: email);
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

  @override
  Future<Either<Failure, UserModel 
>> verifyOtp(
      {required String email, required String otp}) async {
    try {
      var result = await remoteConfirmOtp.call(email: email, otp: otp);
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

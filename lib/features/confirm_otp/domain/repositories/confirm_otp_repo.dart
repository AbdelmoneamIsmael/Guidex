import 'package:dartz/dartz.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/models/user/user_model.dart';

abstract class ConfirmOtpRepo {
  Future<Either<Failure, BasicResponseModel>> sendOtp({required String email});

  Future<Either<Failure, UserModel>> verifyOtp({
    required String email,
    required String otp,
  });
}

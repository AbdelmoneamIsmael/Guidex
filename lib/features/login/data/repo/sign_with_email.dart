import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/user/user_model.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/core/utils/cache_helper.dart';
import 'package:guidix/features/login/data/model/sign_in_model.dart';
import 'package:guidix/features/login/data/repo/signin_repo.dart';

class SignWithEmail extends SigninRepo with PerfumeSignIn {
  final LoginPrameters signInModel;

  SignWithEmail({required this.signInModel});
  @override
  Future<Either<Failure, UserModel>> login() async {
    try {
      var result = await super.perfumeSignIn(
        data: signInModel.toJson(),
        endPoint: '/api/Authentication/login',
      );

      return result;
    } catch (e) {
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

mixin class PerfumeSignIn {
  final ApiServer apiServer = ApiServer();

  Future<Either<Failure, UserModel>> perfumeSignIn({
    required Object? data,
    required String endPoint,
  }) async {
    try {
      var result = await apiServer.post(
        data: data,
        endPoint: endPoint,
      );
      await CacheHelper.setSecuerString(
        key: GetStoreageKey.accessToken,
        value: result["data"]["token"],
      );
      await CacheHelper.setSecuerString(
        key: GetStoreageKey.refreshToken,
        value: result["data"]["refreshToken"],
      );
      UserModel userModel = UserModel.fromJson(result["data"]);
      return Right(userModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure( code: internalLocalError, message: e.toString()));
      }
    }
  }
}

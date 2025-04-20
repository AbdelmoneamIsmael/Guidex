import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:perfume_ecommerce/core/const/cache_keys.dart';
import 'package:perfume_ecommerce/core/error/failure.dart';
import 'package:perfume_ecommerce/core/global_repo/repo/sign_in/signin_repo.dart';
import 'package:perfume_ecommerce/core/models/user/user_model.dart';
import 'package:perfume_ecommerce/core/utils/api/api_server.dart';
import 'package:perfume_ecommerce/core/utils/cache_helper.dart';
import 'package:perfume_ecommerce/features/login_page.dart/data/model/sign_in_model.dart';

class SignWithEmail extends SigninRepo with PerfumeSignIn {
  final SignInModel signInModel;

  SignWithEmail({required this.signInModel});
  @override
  Future<Either<Failure, UserModel>> login() async {
    try {
      var result = await super.perfumeSignIn(
        data: signInModel.toJson(),
        endPoint: '/api/Authentication/token',
      );

      return result;
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
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
        key: CacheKeys.accessToken,
        value: result["data"]["token"],
      );
      await CacheHelper.setSecuerString(
        key: CacheKeys.refreshToken,
        value: result["data"]["refreshToken"],
      );
      UserModel userModel = UserModel.fromJson(result["data"]);
      return Right(userModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

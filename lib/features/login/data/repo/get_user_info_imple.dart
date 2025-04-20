import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidix/core/error/error.dart';
import 'package:guidix/core/models/user/user_info.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/login/repo/login_repo.dart';

class GetUserInfoImple extends GetUserInfoRepo {
  final ApiServer apiServer = ApiServer();
  @override
  Future<Either<Failure, UserInfoModel>> getUserInfo() async {
    try {
      var result = await apiServer.getRequest(
        uri: "/api/Users/GetUserInfo",
      );
      UserInfoModel userInfoModel = UserInfoModel.fromJson(result);
      return Right(userInfoModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}

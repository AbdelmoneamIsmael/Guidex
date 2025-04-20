import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:perfume_ecommerce/core/error/failure.dart';
import 'package:perfume_ecommerce/core/models/user/user_info.dart';
import 'package:perfume_ecommerce/core/utils/api/api_server.dart';
import 'package:perfume_ecommerce/features/login_page.dart/controller/repository/get_user_info.dart';

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

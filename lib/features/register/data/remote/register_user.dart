import 'package:dio/dio.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/register/domain/entity/register_response.dart';
import 'package:guidix/features/register/domain/entity/register_user_params.dart';

class RegisterUserRemote {
  ApiServer apiServer = ApiServer();
  Future<RegesterResponseModel> registerUser({
    required RegesterUserParams regesterUserParams,
  }) async {
    var result = await apiServer.post(
        data: FormData.fromMap(regesterUserParams.toJson()),
        endPoint: "/api/Users/CreateUser",
        additionalHeaders: {
          "Content-Type": "multipart/form-data",
          "Accept": "text/plain"
        });
    return RegesterResponseModel.fromJson(result);
  }
}

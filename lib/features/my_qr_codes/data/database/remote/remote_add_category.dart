import 'package:dio/dio.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';

class RemoteAddCategory {
  ApiServer apiServer = ApiServer();

  Future<BasicResponseModel> addCategory({
    required String arName,
    required String enName,
  }) async {
    var result = await apiServer.post(
      endPoint: "/api/Category/AddCategory",
      data: FormData.fromMap({"NameAr": arName, "NameEn": enName}),
      additionalHeaders: {"Content-Type": "multipart/form-data"},
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

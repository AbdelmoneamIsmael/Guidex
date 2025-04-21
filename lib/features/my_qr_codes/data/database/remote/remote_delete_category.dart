import 'package:dio/dio.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';

class RemoteDeleteCategory {
  ApiServer apiServer = ApiServer();
  Future<BasicResponseModel> deleteCategory({required int id}) async {
    var result = await apiServer.post(
      endPoint: "/api/Category/DeleteCategory",
      data: FormData.fromMap({"id": id}),
      additionalHeaders: {"Content-Type": "multipart/form-data"},
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

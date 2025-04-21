import 'package:dio/dio.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';

class RemoteUpdateCategory {
  ApiServer apiServer = ApiServer();

  Future<BasicResponseModel> updateCategory({
    required CategoryModel category,
  }) async {
    var result = await apiServer.post(
      endPoint: "/api/Category/UpdateCategory",
      data: FormData.fromMap(category.toJson()),
      additionalHeaders: {"Content-Type": "multipart/form-data"},
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

import 'package:dio/dio.dart';
import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';
import 'package:guidix/features/edit_profile/domain/entity/person_edit_params.dart';

class RemoteUpdateData {
  ApiServer apiServer = ApiServer();

  Future<BasicResponseModel> updateData({
    required PersonEditModelParams userProfile,
  }) async {
    Map<String, dynamic> updateProfile = await userProfile.toJson();
    var result = await apiServer.put(
      endPoint: "/api/Users/EditUser",
      data: FormData.fromMap(updateProfile),
      contentType: "multipart/form-data",
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

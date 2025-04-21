import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';

class RemoteChangePassword {
  ApiServer apiServer = ApiServer();
  Future<BasicResponseModel> changePassword({
    required Map<String, dynamic> data,
  }) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ChangePassword",
      data: {
        "email": data["email"],
        "otp": data["otp"],
        "newPassword": data["newPassword"],
      },
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

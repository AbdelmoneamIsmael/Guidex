import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';

class RemoteConfirmEmail {
  ApiServer apiServer = ApiServer();
  Future<BasicResponseModel> confirmEmail({
    required String email,
  }) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ForgetPassword/$email",
      data: "",
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

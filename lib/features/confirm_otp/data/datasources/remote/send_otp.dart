import 'package:guidix/core/models/response/basic_response.dart';
import 'package:guidix/core/utils/api/api_server.dart';

class RemoteSendOtp {
  ApiServer apiServer = ApiServer();

  Future<BasicResponseModel> call({required String email}) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ResendOTP/$email",
      data: "",
    );
    BasicResponseModel basicResponseModel = BasicResponseModel.fromJson(result);
    return basicResponseModel;
  }
}

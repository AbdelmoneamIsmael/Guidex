import 'package:guidix/core/models/user/user_model.dart';
import 'package:guidix/core/utils/api/api_server.dart';

class RemoteConfirmOtp {
  ApiServer apiServer = ApiServer();
  Future<UserModel> call({required String email, required String otp}) async {
    var result = await apiServer.post(
      endPoint: "/api/Authentication/ConfirmEmail",
      data: {"email": email, "otp": otp},
    );
    UserModel userModel = UserModel.fromJson(result["data"]);
    return userModel;
  }
}

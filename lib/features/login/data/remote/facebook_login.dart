import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:perfume_ecommerce/features/login_page.dart/data/model/facebook_response_model.dart';

class FacebookLoginAuthRepo {
  Future<FaceBookLoginResponseModel> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      userData["token"] = result.accessToken?.tokenString;
      FaceBookLoginResponseModel faceBookLoginResponseModel =
          FaceBookLoginResponseModel.fromJson(userData);
          print(faceBookLoginResponseModel);
      return faceBookLoginResponseModel;
    } else {
      throw Exception(result.message);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfume_ecommerce/core/const/app_const.dart';
import 'package:perfume_ecommerce/core/const/enum.dart';
import 'package:perfume_ecommerce/features/login_page.dart/data/model/sign_in_social_model.dart';

class GoogleResponseModel extends SocialSignIn {
  GoogleResponseModel({
    required super.name,
    required super.email,
    required super.photoUrl,
    required this.id,
    required super.deviceToken,
    required super.loginProvider,
  }) : super(
          loginProviderKey: id,
        );

  final String? id;

  factory GoogleResponseModel.fromJson(Map<String, dynamic> json) {
    return GoogleResponseModel(
      loginProvider: SocialLogin.values.byName(json["loginProvider"]),
      name: json["name"],
      email: json["email"],
      deviceToken: json["deviceToken"],
      photoUrl: json["photoUrl"],
      id: json["id"],
    );
  }

  factory GoogleResponseModel.fromUserCredentials(
      UserCredential userCredential) {
    return GoogleResponseModel(
      name: userCredential.user?.displayName ?? "",
      email: userCredential.user?.email ?? "",
      deviceToken: kDeviceToken,
      photoUrl: userCredential.user?.photoURL,
      id: userCredential.user?.providerData[0].uid,
      loginProvider: SocialLogin.google,
    );
  }

  @override
  String toString() {
    return "$name, $email, $photoUrl, $id, ";
  }
}

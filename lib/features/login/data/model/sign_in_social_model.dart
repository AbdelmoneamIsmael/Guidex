

import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/const/enum.dart';

class SocialSignIn {
  SocialSignIn({
    required this.loginProviderKey,
    required this.loginProvider,
    required this.name,
    required this.email,
    required this.deviceToken,
    required this.photoUrl,
    required this.phoneNumber,
  });

  String? loginProviderKey;
  SocialLogin loginProvider;
  String? name;
  String? email;
  String? deviceToken;
  String? photoUrl;
  String? phoneNumber;

  SocialSignIn copyWith({
    String? loginProviderKey,
    SocialLogin? loginProvider,
    String? name,
    String? email,
    String? deviceToken,
    String? photoUrl,
    String? phoneNumber,
  }) {
    return SocialSignIn(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      loginProviderKey: loginProviderKey ?? this.loginProviderKey,
      loginProvider: loginProvider ?? this.loginProvider,
      name: name ?? this.name,
      email: email ?? this.email,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }

  factory SocialSignIn.fromJson(Map<String, dynamic> json) {
    return SocialSignIn(
      phoneNumber: json["phoneNumber"],
      photoUrl: json["imageUrl"] ?? "",
      loginProviderKey: json["loginProviderKey"],
      loginProvider: SocialLogin.values[json["loginProvider"]],
      name: json["name"],
      email: json["email"],
      deviceToken: kDeviceToken,
    );
  }

  Map<String, dynamic> toJson() => {
        "loginProviderKey": loginProviderKey,
        "phoneNumber": phoneNumber,
        "loginProvider": loginProvider.name,
        "name": name,
        "email": email,
        "deviceToken": kDeviceToken,
        "imageUrl": photoUrl
      };

  @override
  String toString() {
    return "$loginProviderKey, ${loginProvider.name}, $name, $email, $deviceToken, $photoUrl, $phoneNumber";
  }
}

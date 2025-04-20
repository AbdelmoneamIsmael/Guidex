class LoginPrameters {
  final String username;
  final String password;
  final String fcmToken;

  LoginPrameters(
      {required this.username, required this.password, required this.fcmToken});

  Map<String, dynamic> toJson() => {
        "email": username,
        "password": password,
        "deviceToken": fcmToken,
      };
}

class SignInModel {
  final String username;
  final String password;
  final String fcmToken;

  SignInModel(
      {required this.username, required this.password, required this.fcmToken});

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "deviceToken": fcmToken,
      };
}

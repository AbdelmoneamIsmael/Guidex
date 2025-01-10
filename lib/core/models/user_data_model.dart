class UserDataModel {
  final String username;
  final int userId;
  final String firstName;
  final String secondName;
  final String thirdName;
  final String lastName;
  final String state;
  final String country;
  final String city;
  final String phoneNumber;
  final String side;
  final String imageUrl;
  final List<String> roles;
  // final String token;
  UserDataModel({
    required this.username,
    required this.phoneNumber,
    required this.userId,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.lastName,
    required this.state,
    required this.country,
    required this.city,
    required this.side,
    required this.imageUrl,
    required this.roles,
    // required this.token,
  });
}

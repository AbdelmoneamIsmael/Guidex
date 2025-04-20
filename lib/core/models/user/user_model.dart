import 'package:hive/hive.dart';

part 'user_model.g.dart';
@HiveType(typeId: 1)
class UserModel {
  UserModel({
    required this.isAuthenticated,
    required this.id,
    required this.username,
    required this.email,
    required this.refreshTokenExpiration,
    required this.name,
  });

   @HiveField(0) final bool? isAuthenticated;
   @HiveField(1) final int? id;
   @HiveField(2) final String? username;
   @HiveField(3) final String? email;
   @HiveField(4) final DateTime? refreshTokenExpiration;
   @HiveField(5) final String? name;

  UserModel copyWith({
    bool? isAuthenticated,
    int? id,
    String? username,
    String? email,
    DateTime? refreshTokenExpiration,
    String? name,
  }) {
    return UserModel(
      name: name ?? this.name,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      refreshTokenExpiration:
          refreshTokenExpiration ?? this.refreshTokenExpiration,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      isAuthenticated: json["isAuthenticated"],
      id: json["id"],
      username: json["username"],
      email: json["email"],
      refreshTokenExpiration:
          DateTime.tryParse(json["refreshTokenExpiration"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "isAuthenticated": isAuthenticated,
        "id": id,
        "username": username,
        "email": email,
        "refreshTokenExpiration": refreshTokenExpiration?.toIso8601String(),
      };

  @override
  String toString() {
    return "$isAuthenticated, $id, $username, $email, $refreshTokenExpiration, $name"; 
  }
}

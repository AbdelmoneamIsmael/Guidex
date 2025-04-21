import 'package:guidix/core/models/user/role.dart';
import 'package:hive/hive.dart';

part 'user_info.g.dart';

@HiveType(typeId: 2)
class UserInfoModel {
  UserInfoModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.deviceToken,
    required this.imageUrl,
    required this.roles,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? username;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? phoneNumber;
  @HiveField(5)
  final String? deviceToken;
  @HiveField(6)
  final String? imageUrl;
  @HiveField(7)
  final List<Role> roles;

  UserInfoModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phoneNumber,
    String? deviceToken,
    String? imageUrl,
    List<Role>? roles,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      deviceToken: deviceToken ?? this.deviceToken,
      imageUrl: imageUrl ?? this.imageUrl,
      roles: roles ?? this.roles,
    );
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      deviceToken: json["deviceToken"],
      imageUrl: json["imageUrl"],
      roles: json["roles"] == null
          ? []
          : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "deviceToken": deviceToken,
        "imageUrl": imageUrl,
        "roles": roles.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $name, $username, $email, $phoneNumber, $deviceToken, $imageUrl, $roles, ";
  }
}

class Role {
  Role({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  Role copyWith({
    int? id,
    String? name,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return "$id, $name, ";
  }
}

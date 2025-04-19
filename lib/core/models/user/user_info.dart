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
    required this.roles,
    required this.imageUrl,
  });

  @HiveField(0) int id;
  @HiveField(1) String name;
  @HiveField(2) String username;
  @HiveField(3) String email;
  @HiveField(4) String phoneNumber;
  @HiveField(5) String deviceToken;

  @HiveField(6) List<Role> roles;
  @HiveField(8) String? imageUrl;

  UserInfoModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phoneNumber,
    String? deviceToken,
    List<Role>? roles,
    String? imageUrl,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      deviceToken: deviceToken ?? this.deviceToken,
      roles: roles ?? this.roles,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
       imageUrl: json["imageUrl"],
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phoneNumber: json["phoneNumber"]??"000000000000",
      deviceToken: json["deviceToken"],
    
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
        "roles": roles.map((x) => x.toJson()).toList(),
        "imageUrl": imageUrl
      };

  @override
  String toString() {
    return "$id, $name, $username, $email, $phoneNumber, $deviceToken, $roles, ";
  }
}

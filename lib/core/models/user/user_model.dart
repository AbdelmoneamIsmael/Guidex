import 'package:hive/hive.dart';

part 'user_model.g.dart';
@HiveType(typeId: 1)
class UserModel {
    UserModel({
        required this.message,
        required this.isAuthenticated,
        required this.id,
        required this.email,
        required this.deviceToken,
        required this.imageUrl,
        required this.roles,
        required this.token,
        required this.expiresOn,
        required this.refreshToken,
        required this.refreshTokenExpiration,
        required this.statusCode,
    });

   @HiveField(0) final String? message;
   @HiveField(1) final bool? isAuthenticated;
   @HiveField(2) final int? id;
   @HiveField(3) final String? email;
   @HiveField(4) final String? deviceToken;
   @HiveField(5) final String? imageUrl;
   @HiveField(6) final List<String> roles;
   @HiveField(7) final String? token;
   @HiveField(8) final DateTime? expiresOn;
   @HiveField(9) final String? refreshToken;
   @HiveField(10) final DateTime? refreshTokenExpiration;
   @HiveField(11) final num? statusCode;

    UserModel copyWith({
        String? message,
        bool? isAuthenticated,
        int? id,
        String? email,
        String? deviceToken,
        String? imageUrl,
        List<String>? roles,
        String? token,
        DateTime? expiresOn,
        String? refreshToken,
        DateTime? refreshTokenExpiration,
        num? statusCode,
    }) {
        return UserModel(
            message: message ?? this.message,
            isAuthenticated: isAuthenticated ?? this.isAuthenticated,
            id: id ?? this.id,
            email: email ?? this.email,
            deviceToken: deviceToken ?? this.deviceToken,
            imageUrl: imageUrl ?? this.imageUrl,
            roles: roles ?? this.roles,
            token: token ?? this.token,
            expiresOn: expiresOn ?? this.expiresOn,
            refreshToken: refreshToken ?? this.refreshToken,
            refreshTokenExpiration: refreshTokenExpiration ?? this.refreshTokenExpiration,
            statusCode: statusCode ?? this.statusCode,
        );
    }

    factory UserModel.fromJson(Map<String, dynamic> json){ 
        return UserModel(
            message: json["message"],
            isAuthenticated: json["isAuthenticated"],
            id: json["id"],
            email: json["email"],
            deviceToken: json["deviceToken"],
            imageUrl: json["imageUrl"],
            roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
            token: json["token"],
            expiresOn: DateTime.tryParse(json["expiresOn"] ?? ""),
            refreshToken: json["refreshToken"],
            refreshTokenExpiration: DateTime.tryParse(json["refreshTokenExpiration"] ?? ""),
            statusCode: json["statusCode"],
        );
    }

    Map<String, dynamic> toJson() => {
        "message": message,
        "isAuthenticated": isAuthenticated,
        "id": id,
        "email": email,
        "deviceToken": deviceToken,
        "imageUrl": imageUrl,
        "roles": roles.map((x) => x).toList(),
        "token": token,
        "expiresOn": expiresOn?.toIso8601String(),
        "refreshToken": refreshToken,
        "refreshTokenExpiration": refreshTokenExpiration?.toIso8601String(),
        "statusCode": statusCode,
    };

    @override
    String toString(){
        return "$message, $isAuthenticated, $id, $email, $deviceToken, $imageUrl, $roles, $token, $expiresOn, $refreshToken, $refreshTokenExpiration, $statusCode, ";
    }
}


import 'package:guidix/core/const/enum.dart';
import 'package:guidix/features/login/data/model/sign_in_social_model.dart';

class FaceBookLoginResponseModel extends SocialSignIn {
  FaceBookLoginResponseModel({
    required super.name,
    required super.email,
    required this.picture,
    required this.id,
    required this.token,
    required super.deviceToken,
  }) : super(
          loginProviderKey: id,
          loginProvider: SocialLogin.facebook,
          photoUrl: picture?.data?.url,
        );

  final Picture? picture;
  final String? id;
  final String? token;

  factory FaceBookLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return FaceBookLoginResponseModel(
      name: json["name"],
      email: json["email"],
      deviceToken: json["deviceToken"],
      picture:
          json["picture"] == null ? null : Picture.fromJson(json["picture"]),
      id: json["id"],
      token: json["token"],
    );
  }

  @override
  String toString() {
    return "$name, $email, $picture, $id, $token, ";
  }
}

class Picture {
  Picture({
    required this.data,
  });

  final Data? data;

  Picture copyWith({
    Data? data,
  }) {
    return Picture(
      data: data ?? this.data,
    );
  }

  factory Picture.fromJson(Map<dynamic, dynamic> json) {
    return Picture(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };

  @override
  String toString() {
    return "$data, ";
  }
}

class Data {
  Data({
    required this.height,
    required this.isSilhouette,
    required this.url,
    required this.width,
  });

  final num? height;
  final bool? isSilhouette;
  final String? url;
  final int? width;

  Data copyWith({
    num? height,
    bool? isSilhouette,
    String? url,
    int? width,
  }) {
    return Data(
      height: height ?? this.height,
      isSilhouette: isSilhouette ?? this.isSilhouette,
      url: url ?? this.url,
      width: width ?? this.width,
    );
  }

  factory Data.fromJson(Map<dynamic, dynamic> json) {
    return Data(
      height: json["height"],
      isSilhouette: json["is_silhouette"],
      url: json["url"],
      width: json["width"],
    );
  }

  Map<String, dynamic> toJson() => {
        "height": height,
        "is_silhouette": isSilhouette,
        "url": url,
        "width": width,
      };

  @override
  String toString() {
    return "$height, $isSilhouette, $url, $width, ";
  }
}

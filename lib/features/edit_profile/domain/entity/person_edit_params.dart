import 'dart:io';
import 'package:http_parser/http_parser.dart' as http;
import 'package:mime/mime.dart';
import 'package:dio/dio.dart';

class PersonEditModelParams {
  PersonEditModelParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.image,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final File? image;

  PersonEditModelParams copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    File? image,
  }) {
    return PersonEditModelParams(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
    );
  }

  factory PersonEditModelParams.fromJson(Map<String, dynamic> json) {
    return PersonEditModelParams(
      name: json["name"],
      email: json["Email"],
      password: json["Password"],
      phoneNumber: json["PhoneNumber"],
      image: json["Image"],
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    MultipartFile? imageFile;
    MultipartFile? cv;
    // Check if the image path is valid
    if (image != null) {
      if (image == null || !await File(image!.path).exists()) {
        throw Exception("Image file does not exist.");
      }

      // Use mime package to get the correct content type
      String? mimeType = lookupMimeType(image!.path);
      if (mimeType == null) {
        throw Exception("Could not determine the MIME type.");
      }

      imageFile = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split("/").last,
        contentType:
            http.MediaType.parse(mimeType), // Set the correct content type
      );
    }

    return {
      "name": name,
      "Email": email,
      "Password": password,
      "PhoneNumber": phoneNumber,
      "Image": imageFile,
    };
  }

  @override
  String toString() {
    return "$name, $email, $password, $phoneNumber, $image, ";
  }
}

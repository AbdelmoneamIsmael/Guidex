import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

mixin ImageHelperMixin {
  Future<File> loadDefaultUserImage() async {
    // Load image as bytes
    final ByteData data =
        await rootBundle.load('assets/images/company-default.png');
    final Uint8List bytes = data.buffer.asUint8List();

    // Get the temporary directory
    final Directory tempDir = await getTemporaryDirectory();
    final String path = '${tempDir.path}/company-default.png';

    // Write the image bytes to a file
    File image = File(path);
    var result = await image.writeAsBytes(bytes);
    return result;
  }

  Future<File> pickCamiraImage() async {
    await Permission.camera.request();
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? result = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (result != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: result.path,
      );
      if (croppedFile != null) {
        File image = File(croppedFile.path);
        return image;
      } else {
        throw Exception("couldn't crop image");
      }
    } else {
      throw Exception("couldn't take image");
    }
  }
}

Future<File> pickGallaryImage() async {
  await Permission.accessMediaLocation.request();
  await Permission.photos.request();
  await Permission.storage.request();

  final ImagePicker picker = ImagePicker();
  // Pick an image.
  final XFile? result = await picker.pickImage(
    source: ImageSource.gallery,
  );

  if (result != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: result.path,
    );
    if (croppedFile != null) {
      File image = File(croppedFile.path);
      return image;
    } else {
      throw Exception("couldn't crop image");
    }
  } else {
    throw Exception("couldn't pick image");
  }
}

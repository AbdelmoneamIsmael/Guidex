// import 'dart:io';

// import 'package:image/image.dart' as img;
// import 'package:image_picker/image_picker.dart';

// mixin ImageMixin {
//   final imagePicker = ImagePicker();
//   bool isNoPhoto = true;

//   Future<File> getGalleryImage() async {
//     var result = await imagePicker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//       maxHeight: 500,
//       maxWidth: 500,
//     );
//     if (result != null) {
//       File file = File(result.path);

//       isNoPhoto = false;

//       file = await compress(
//         targetImage: file,
//       );

//       return file;
//     } else {
//       return File("");
//     }
//   }

//   Future<File> getCameraImage() async {
//     var result = await imagePicker.pickImage(
//       source: ImageSource.camera,
//       imageQuality: 60,
//       maxHeight: 400,
//       maxWidth: 680,
//     );

//     if (result != null) {
//       File file = File(result.path);
//       isNoPhoto = false;
//       file = await compress(
//         targetImage: file,
//       );

//       return file;
//     } else {
//       return File("");
//     }
//   }

//   Future<File> compress({
//     required File targetImage,
//   }) async {
//     img.Image? image = img.decodeImage(targetImage.readAsBytesSync());
//     //lossless compression :just menimize width and height
//     img.Image resizedImage = img.copyResize(image!,
//         width: image.width,
//         height: image.height); //width:image.width, height:image.height);
//     //lossy compression : menimize quality or resolution
//     List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 80);
//     // get extention of target image
//     String extention = targetImage.path.split('.').last;
//     // change extention to compressed extention
//     File compressedFile = File(targetImage.path
//         .replaceAll(RegExp(r'\.[^\.]+$'), '_compressed.$extention'));
//     //do render for new image
//     compressedFile.writeAsBytesSync(compressedBytes);

//     // _sizeAfterCompression = compressedFile.lengthSync();   //size after compression
//     return compressedFile;
// //------------------------------------------------------------------------------
//     // img.Image? image = img.decodeImage(targetImage.readAsBytesSync());

//     // // Resize the image to have the longer side be 800 pixels
//     // int width;
//     // int height;

//     // if (image!.width > image.height) {
//     //   width = 800;
//     //   height = (image.height / image.width * 800).round();
//     // } else {
//     //   height = 800;
//     //   width = (image.width / image.height * 800).round();
//     // }

//     // img.Image resizedImage =
//     //     img.copyResize(image, width: width, height: height);

//     // // Compress the image with JPEG format
//     // List<int> compressedBytes =
//     //     img.encodeJpg(resizedImage, quality: 85); // Adjust quality as needed

//     // // Save the compressed image to a file
//     // File compressedFile =
//     //     File(targetImage.path.replaceFirst('.png', '_compressed.png'));
//     // compressedFile.writeAsBytesSync(compressedBytes);

//     // return compressedFile;
//   }
// }

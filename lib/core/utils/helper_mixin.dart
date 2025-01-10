// import 'dart:io';
// import 'package:flutter_native_image/flutter_native_image.dart';
// // import 'package:image/image.dart' as img;
// mixin HelperMixin {
//   Future<File> compress(
//     {
//     required File image,
//   }
//   ) async {
//     ImageProperties properties =
//         await FlutterNativeImage.getImageProperties(image.path);
//     final path = await FlutterNativeImage.compressImage(image.path,
//         quality: 90,
//         targetWidth: 600,
//         targetHeight: (properties.height! * 600 / properties.width!).round());

//     return path;
//   //   final image = img.Image(width: 256, height: 256);
//   // // Iterate over its pixels
//   // for (var pixel in image) {
//   //   // Set the pixels red value to its x position value, creating a gradient.
//   //   pixel..r = pixel.x
//   //   // Set the pixels green value to its y position value.
//   //   ..g = pixel.y;
//   // }
//   // // Encode the resulting image to the PNG image format.
//   // final png = img.encodePng(image);
//   // // Write the PNG formatted data to a file.
//   // var val=  await File('image.png').writeAsBytes(png);
//   // return val;
//   }

// }

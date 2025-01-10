// import 'package:flutter/material.dart';
// import 'package:generator/core/helper/responsive_helper.dart';
// import 'package:generator/core/themes/colors/colors.dart';
// import 'package:generator/core/themes/text/test_style.dart';
// import 'package:generator/features/register/presentation/controller/register_controller.dart';
// import 'package:get/get.dart';

// class UploadImageSheet extends GetView<RegisterController> {
//   const UploadImageSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'اختر صورة',
//             style: AppTextStyles.semiBold.copyWith(
//               fontSize: 20.responsiveFontSize,
//               color: AppColors.mainColor,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                   child: ElevatedButton(
//                 onPressed: () async {
//                   controller.image = await controller.getGalleryImage();
//                   controller.controllers[9].text = controller.image!.path;
//                   Get.back();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.mainColor,
//                   shape: const StadiumBorder(),
//                 ),
//                 child: Text(
//                   'معرض الصور',
//                   style: AppTextStyles.semiBold.copyWith(
//                     fontSize: 20.responsiveFontSize,
//                     color: Colors.white,
//                   ),
//                 ),
//               )),
//               const SizedBox(width: 20),
//               Expanded(
//                   child: ElevatedButton(
//                 onPressed: () async {
//                   controller.image = await controller.getCameraImage();
//                   controller.controllers[9].text = controller.image!.path;
//                   Get.back();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.mainColor,
//                   shape: const StadiumBorder(),
//                 ),
//                 child: Text(
//                   'الكاميرا',
//                   style: AppTextStyles.semiBold.copyWith(
//                     fontSize: 20.responsiveFontSize,
//                     color: Colors.white,
//                   ),
//                 ),
//               )),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// // import 'package:generator/core/themes/colors/colors.dart';
// // import 'package:generator/core/themes/text/test_style.dart';
// import 'package:get/get.dart';

// class UIHelper {
//   static BoxShadow shadow() {
//     return BoxShadow(
//       color: Colors.grey.withOpacity(0.5),
//       spreadRadius: 1,
//       blurRadius: 7,
//       offset: const Offset(0, 3),
//     );
//   }

//   static void showSnackbar(
//     String title,
//     String message, {
//     Color? backgroundColor,
//     Color colorText = AppColors.white,
//     Function? onTap,
//   }) {
//     Get.snackbar(
//       duration: const Duration(seconds: 3),
//       title,
//       message,
//       backgroundColor: backgroundColor ?? AppColors.mainColor.withOpacity(.5),
//       margin: const EdgeInsets.all(10),
//       colorText: colorText,
//       onTap: (value) => onTap!(),
//       titleText: MediaQuery(
//         data: MediaQuery.of(Get.context!)
//             .copyWith(textScaler: const TextScaler.linear(1)),
//         child: Text(
//           title,
//           style: AppTextStyles.semiBold.copyWith(
//             color: colorText,
//             fontSize: 16,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       messageText: MediaQuery(
//         data: MediaQuery.of(Get.context!)
//             .copyWith(textScaler: const TextScaler.linear(1)),
//         child: Text(
//           message,
//           style: AppTextStyles.medium.copyWith(
//             color: colorText,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }

//   // static void showModel({
//   //   required String message,
//   //   required String title,
//   //   String? buttonText,
//   //   required void Function()? buttonAction,
//   //   required BuildContext context,
//   //   SnackBarType? type,
//   // }) {
//   //   Color color = type != null ? _getColor(type) : Colors.red;
//   //   showDialog(
//   //     builder: (context) {
//   //       return UnconstrainedBox(
//   //         child: Container(
//   //           padding: EdgeInsets.all(18.responsiveWidth),
//   //           width: MediaQuery.of(context).size.width * 0.8,
//   //           decoration: BoxDecoration(
//   //             color: Colors.white,
//   //             borderRadius: BorderRadius.circular(4),
//   //           ),
//   //           child: Material(
//   //             color: Colors.transparent,
//   //             child: Column(
//   //               children: [
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.start,
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     if (type != null)
//   //                       SvgPicture.asset(
//   //                         _getIcon(type),
//   //                         width: 24.responsiveWidth,
//   //                         height: 24.responsiveHeight,
//   //                       ),
//   //                     if (type != null) 12.horizontalSpace,
//   //                     Expanded(
//   //                       child: Column(
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           Text(
//   //                             title,
//   //                             style: TextStyle(
//   //                                 fontWeight: FontWeight.w500,
//   //                                 fontSize: 16.responsiveFontSize),
//   //                           ),
//   //                           8.verticalSpace,
//   //                           Text(
//   //                             message,
//   //                             style: TextStyle(
//   //                               fontWeight: FontWeight.w400,
//   //                               fontSize: 14.responsiveFontSize,
//   //                               color: Colors.grey,
//   //                             ),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //                 50.verticalSpace,
//   //                 Row(
//   //                   children: [
//   //                     const Expanded(
//   //                       child: SizedBox(),
//   //                     ),
//   //                     PrimaryButton(
//   //                       height: 36.responsiveHeight,
//   //                       backgroundColor: color,
//   //                       forGroundColor: Colors.white,
//   //                       title: buttonText ?? "Okay",
//   //                       onPressed: buttonAction,
//   //                     ),
//   //                     12.horizontalSpace,
//   //                     PrimaryButton(
//   //                       title: "Cancel",
//   //                       height: 36.responsiveHeight,
//   //                       backgroundColor: color.withOpacity(0.2),
//   //                       forGroundColor: color,
//   //                       onPressed: () {
//   //                         Navigator.pop(context);
//   //                       },
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ],
//   //             ),
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //     context: context,
//   //   );
//   // }

//   // static void showBackDialog(
//   //     {required String message,
//   //     required String title,
//   //     required void Function()? onPressed,
//   //     required BuildContext context}) {
//   //   showCupertinoModalPopup(
//   //     context: context,
//   //     builder: (context) => CupertinoAlertDialog(
//   //       title: Text(
//   //         title,
//   //         style: const TextStyle(fontWeight: FontWeight.w500),
//   //       ),
//   //       content: Text(
//   //         message,
//   //         style: const TextStyle(fontWeight: FontWeight.w500),
//   //       ),
//   //       actions: <CupertinoDialogAction>[
//   //         CupertinoDialogAction(
//   //           child: Text(
//   //             // LangConfig.localization['cancel'],
//   //             LangConfig.localization['cancel'],
//   //             style: const TextStyle(
//   //               fontWeight: FontWeight.w400,
//   //               color: AppColors.redColor,
//   //             ),
//   //           ),
//   //           onPressed: () => Navigator.of(context).pop(),
//   //         ),
//   //         CupertinoDialogAction(
//   //           onPressed: () async {
//   //             dynamic pressaction;
//   //             if (onPressed != null) pressaction = onPressed;
//   //             pressaction();
//   //             Navigator.of(context).pop();
//   //           },
//   //           child: Text(
//   //             LangConfig.localization['iam_sure'],
//   //             style: const TextStyle(
//   //               fontWeight: FontWeight.w400,
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }

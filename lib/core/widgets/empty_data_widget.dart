// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:guidix/core/helper/responsive_helper.dart';


// class EmptyDataWidget extends StatelessWidget {
//   const EmptyDataWidget({
//     super.key,
//     required this.title,
//     required this.subTitle,
//     required this.path,
//   });
//   final String title, subTitle, path;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SvgPicture.asset(
//           path,
//           fit: BoxFit.scaleDown,
//         ),
//         8.verticalSpace,
//         Text(
//           title,
//           style: AppTextStyles.semiBold.copyWith(
//             fontSize: 20.responsiveFontSize,
//             color: AppColors.mainColor,
//           ),
//         ),
//         Text(
//           subTitle,
//           style: AppTextStyles.light.copyWith(
//             fontSize: 16.responsiveFontSize,
//             height: 1.5,
//             color: AppColors.grey100,
//           ),
//         ),
//       ],
//     );
//   }
// }

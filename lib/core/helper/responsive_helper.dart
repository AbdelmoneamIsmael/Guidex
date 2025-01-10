import 'package:flutter/widgets.dart';


extension ResponsiveHelper on num {
  /// responsive height
  double responsiveHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height * this / 852;

  /// responsive width
  double responsiveWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width * this / 393;

  /// responsive font size
  double responsiveFontSize(BuildContext context) =>
      this * MediaQuery.sizeOf(context).width / 393;

  /// vertical Responsive space
  SizedBox verticalSpace(BuildContext context) =>
      SizedBox(height: responsiveHeight(context));

  /// horizontal Responsive space
  SizedBox horizontalSpace(BuildContext context) =>
      SizedBox(width: responsiveWidth(context));
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/utils/functions/get_hight.dart';

abstract class AppTextStyle {
  // static late BuildContext context;
  // static setContext(BuildContext ctx) {
  //   print ("setContext");
  //   return context (BuildContext context)=> ctx;
  // }
  //regular
  static TextStyle regular16(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: getTextHeight(16, 19.36),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle regular16h24(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: getTextHeight(16, 24),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle regular14(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: getTextHeight(14, 16.94),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle regular14h21(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: getTextHeight(14, 21),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle regular12(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: getTextHeight(12, 14.52),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  //medium
  static TextStyle medium16(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        height: getTextHeight(16, 19.36),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle medium16h24(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        height: getTextHeight(16, 24),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle medium14(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: getTextHeight(14, 16.94),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle medium18(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        height: getTextHeight(18, 21.78),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle medium20(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        height: getTextHeight(20, 24.2),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  //semiBold
  static TextStyle simiBold16(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: getTextHeight(16, 19.36),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle simiBold20(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        height: getTextHeight(20, 24.2),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  static TextStyle simiBold18(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: getTextHeight(18, 21.78),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
  //bold
  static TextStyle bold16(BuildContext context) => TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyMedium!.fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        height: getTextHeight(16, 19.36),
        color: Theme.of(context).textTheme.bodyMedium!.color,
      );
}

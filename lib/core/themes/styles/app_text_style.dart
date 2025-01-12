import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/utils/functions/get_hight.dart';

abstract class AppTextStyle {
  static late BuildContext context;
  static setContext(BuildContext ctx) => context = ctx;
  //regular
  static TextStyle regular16 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: getTextHeight(16, 19.36),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle regular16h24 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: getTextHeight(16, 24),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle regular14 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: getTextHeight(14, 16.94),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle regular14h21 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: getTextHeight(14, 21),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle regular12 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: getTextHeight(12, 14.52),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  //medium
  static TextStyle medium16 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: getTextHeight(16, 19.36),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle medium16h24 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: getTextHeight(16, 24),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle medium14 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: getTextHeight(14, 16.94),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle medium18 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    height: getTextHeight(18, 21.78),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle medium20 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    height: getTextHeight(20, 24.2),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  //semiBold
  static TextStyle simiBold16 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: getTextHeight(16, 19.36),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle simiBold20 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: getTextHeight(20, 24.2),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  static TextStyle simiBold18 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    height: getTextHeight(18, 21.78),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
  //bold
  static TextStyle bold16 = TextStyle(
    fontFamily:  Theme.of(context).textTheme.bodyMedium!.fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: getTextHeight(16, 19.36),
    color: Theme.of(context).textTheme.bodyMedium!.color,
  );
}

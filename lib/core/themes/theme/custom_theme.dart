import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/themes/colors/colors.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/utils/functions/get_hight.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightColors.backgroundColor,
  primaryColor: LightColors.mainColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: LightColors.textColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: LightColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: LightColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: LightColors.textColor,
      fontSize: 20.sp,
      height: getTextHeight(20, 24.2),
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
      ),
      textStyle: AppTextStyle.simiBold16,
      fixedSize: Size(double.maxFinite, 48.h),
      foregroundColor: Colors.white,
    ),
  ),
);

///
///
///dark theme
///
///
///
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkColors.backgroundColor,
  primaryColor: DarkColors.mainColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: DarkColors.textColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: DarkColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: DarkColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: DarkColors.textColor,
      fontSize: 20.sp,
      height: getTextHeight(20, 24.2),
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(
      color: DarkColors.mainColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkColors.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
      ),
      textStyle: AppTextStyle.simiBold16,
      fixedSize: Size(double.maxFinite, 48.h),
      foregroundColor: Colors.white,
    ),
  ),
);

///
///
///
///inverter theme
///
///
///
ThemeData inverterTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: InverterColors.backgroundColor,
  primaryColor: InverterColors.mainColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: InverterColors.textColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: InverterColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: InverterColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: InverterColors.textColor,
      fontSize: 20.sp,
      height: getTextHeight(20, 24.2),
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(
      color: InverterColors.mainColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: InverterColors.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
      ),
      textStyle: AppTextStyle.simiBold16, 
      fixedSize: Size(double.maxFinite, 48.h),
      foregroundColor: Colors.white,
    ),
  ),
);

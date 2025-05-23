import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/themes/colors/colors.dart';

import 'package:guidix/core/utils/functions/get_hight.dart';

ThemeData lightTheme = ThemeData(
  switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all<Color>(Colors.white),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? LightColors.mainColor
            : LightColors.grey1,
      )),
  fontFamily: kEnglishFontFamily,
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightColors.backgroundColor,
  primaryColor: LightColors.mainColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.light().copyWith(
    surface: LightColors.onBoardingColor,
    scrim: LightColors.grey1,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: kEnglishFontFamily,
      color: LightColors.textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: kEnglishFontFamily,
      color: LightColors.text2Color,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: LightColors.bottomNavColor,
  ),
  iconTheme: const IconThemeData(
    color: LightColors.textColor,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: LightColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: LightColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: LightColors.textColor,
      fontFamily: kEnglishFontFamily,
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
      textStyle: TextStyle(
        fontFamily: kEnglishFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: getTextHeight(16, 19.36),
        color: LightColors.textColor,
      ),
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
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all<Color>(Colors.white),
    trackColor: WidgetStateColor.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? DarkColors.mainColor
          : Colors.grey,
    ),
  ),
  fontFamily: kEnglishFontFamily,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkColors.backgroundColor,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: DarkColors.bottomNavColor,
  ),
  iconTheme: const IconThemeData(
    color: DarkColors.textColor,
  ),
  primaryColor: DarkColors.mainColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark().copyWith(
    surface: DarkColors.onBoardingColor,
    scrim: DarkColors.grey1,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: kEnglishFontFamily,
      color: DarkColors.textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: kEnglishFontFamily,
      color: DarkColors.text2Color,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: DarkColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: DarkColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: kEnglishFontFamily,
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
        side: const BorderSide(
          color: DarkColors.mainColor,
        ),
      ),
      textStyle: TextStyle(
        fontFamily: kEnglishFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: getTextHeight(16, 19.36),
        color: DarkColors.textColor,
      ),
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
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all<Color>(Colors.white),
    trackColor: WidgetStateColor.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? InverterColors.mainColor
          : Colors.grey,
    ),
  ),
  fontFamily: kEnglishFontFamily,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: InverterColors.backgroundColor,
  primaryColor: InverterColors.mainColor,
  iconTheme: const IconThemeData(
    color: DarkColors.textColor,
  ),
  useMaterial3: true,
  colorScheme: const ColorScheme.dark().copyWith(
    surface: InverterColors.onBoardingColor,
    scrim: InverterColors.grey1,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: kEnglishFontFamily,
      color: InverterColors.textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: kEnglishFontFamily,
      color: InverterColors.text2Color,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: InverterColors.bottomNavColor,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: InverterColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: InverterColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: kEnglishFontFamily,
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
        side: const BorderSide(
          color: InverterColors.mainColor,
        ),
      ),
      textStyle: TextStyle(
        fontFamily: kEnglishFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: getTextHeight(16, 19.36),
        color: InverterColors.textColor,
      ),
      fixedSize: Size(double.maxFinite, 48.h),
      foregroundColor: Colors.white,
    ),
  ),
);

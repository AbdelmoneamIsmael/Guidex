import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/themes/colors/colors.dart';

ThemeData lightTheme() => ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          color: AppColors.forGroundColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          color: AppColors.forGroundColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.forGroundColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.mainColor,
    );

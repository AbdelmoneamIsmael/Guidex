import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/themes/theme/custom_theme.dart';

class AppController extends GetxController {
  ThemeData appTheme = lightTheme;

  String langCode = 'en';
  String fontFamily = 'Inter';

  changeTheme(ThemeData theme) {
    appTheme = theme;
    update();
  }

  changeLanguage() {
    langCode = langCode == 'en' ? 'ar' : 'en';
    if (langCode == 'en') {
      fontFamily = kEnglishFontFamily;
    } else {
      fontFamily = kArabicFontFamily;
    }
    Get.forceAppUpdate();
    Get.updateLocale(Locale(langCode));

    update();
  }
}

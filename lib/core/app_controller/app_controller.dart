import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/themes/theme/custom_theme.dart';

class AppController extends GetxController {
  ThemeData appTheme = lightTheme;

  String langCode = 'en';

  changeTheme(ThemeData theme) {
    appTheme = theme;
    update();
  }

  changeLanguage() {
    langCode = langCode == 'en' ? 'ar' : 'en';
    Get.updateLocale(Locale(langCode));
    update();
  }
}

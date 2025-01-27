import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/models/application_model.dart';
import 'package:guidix/core/themes/theme/custom_theme.dart';

class AppController extends GetxController {
  final box = GetStorage();
  late ApplicationModel appModel = ApplicationModel(
    theme: ApplicationTheme.light,
    language: ApplicationLanguage.en,
    applicationName: kEnglishFontFamily,
    fontFamily: kEnglishFontFamily,
  );
  @override
  void onInit() {
    box.read('applicationModel') != null
        ? appModel = appModel.fromJson(jsonDecode(box.read('applicationModel')))
        : appModel = ApplicationModel(
            theme: ApplicationTheme.light,
            language: WidgetsBinding.instance.window.locale.languageCode == "en"
                ? ApplicationLanguage.en
                : ApplicationLanguage.ar,
            applicationName:
                WidgetsBinding.instance.window.locale.languageCode == "en"
                    ? kEnglishFontFamily
                    : kArabicFontFamily,
            fontFamily: kEnglishFontFamily,
          );

    super.onInit();
  }

  changeTheme(ApplicationTheme theme) {
    switch (theme) {
      case ApplicationTheme.light:
        appModel.theme = ApplicationTheme.light;
        appModel.fontFamily = kEnglishFontFamily;
        break;
      case ApplicationTheme.dark:
        appModel.theme = ApplicationTheme.dark;
        break;
      case ApplicationTheme.inverter:
        appModel.theme = ApplicationTheme.inverter;

        break;
    }
    final jsonString = jsonEncode(appModel.toJson());
    box.write('applicationModel', jsonString);
    update();
  }

  changeLanguage() {
    switch (appModel.language) {
      case ApplicationLanguage.ar:
        appModel.language = ApplicationLanguage.en;

        appModel.fontFamily = kArabicFontFamily;
        break;
      case ApplicationLanguage.en:
        appModel.language = ApplicationLanguage.ar;

        appModel.fontFamily = kEnglishFontFamily;
        break;
    }
    Get.forceAppUpdate();
    Get.updateLocale(
      Locale(appModel.language.name),
    );

    final jsonString = jsonEncode(appModel.toJson());
    box.write('applicationModel', jsonString);

    update();
  }

  ThemeData getTheme() {
    switch (appModel.theme) {
      case ApplicationTheme.light:
        return lightTheme;
      case ApplicationTheme.dark:
        return darkTheme;
      case ApplicationTheme.inverter:
        return inverterTheme;
    }
  }
}

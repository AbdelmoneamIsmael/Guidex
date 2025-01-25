import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/models/application_model.dart';
import 'package:guidix/core/themes/theme/custom_theme.dart';

class AppController extends GetxController {
  final box = GetStorage();
  late ApplicationModel appModel;
  @override
  void onInit() {
    box.read<ApplicationModel>('applicationModel') != null
        ? appModel = box.read<ApplicationModel>('applicationModel')!
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
    update();
  }

  changeLanguage(
    ApplicationLanguage language,
  ) {
    switch (language) {
      case ApplicationLanguage.ar:
        appModel.language = ApplicationLanguage.ar;

        appModel.fontFamily = kArabicFontFamily;
        break;
      case ApplicationLanguage.en:
        appModel.language = ApplicationLanguage.en;

        appModel.fontFamily = kEnglishFontFamily;
        break;
    }
    Get.forceAppUpdate();
    Get.updateLocale(
      Locale(appModel.language.name),
    );

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

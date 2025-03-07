import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/models/application_model.dart';
import 'package:guidix/core/models/qrcode_generation.dart';
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

  List<QrCodeGeenerationModel> qrCodeList = [
    QrCodeGeenerationModel(
      qrCodeId: "e4d0a0lemn72m01939ob21761A2",
      nameEn: "خمار",
      nameAr: "veil",
      describtonEn: "خمار طويل لونه رصاصي يُلبس عند الذهاب الي الجامعة",
      descriptionAr: "Long gray veil worn when going to university",
    ),
    QrCodeGeenerationModel(
      qrCodeId: "o72ae8124ml25md01b5n969Ae21",
      nameEn: "yogurt",
      nameAr: "زبادي",
      describtonEn: "yogurt with date of expiration 2022-12-31",
      descriptionAr: "زبادي مع تاريخ الانتهاء 2022-12-31",
    ),
    QrCodeGeenerationModel(
      qrCodeId: "e6la612224m715mdo2nbA10499e",
      nameEn: "Flurest",
      nameAr: "  فلوريست",
      describtonEn: "for Flu 3 times after eating Expire date at 2022-12-31 ",
      descriptionAr: "لنزلات البرد  3 مرات بعد الاكل تاريخ الانتهاء 2022-12-31",
    ),
  ];
  List<Map<String, dynamic>> ids = [
    {
      "id": "e4d0a0lemn72m01939ob21761A2",
      "value": true,
    },
    {
      "id": "4712me31m021e2db5n967o94Ala",
      "value": false,
    },
    {
      "id": "45a411o2m226b10d9911elme7An",
      "value": false,
    },
    {
      "id": "e6la612224m715mdo2nbA10499e",
      "value": false,
    },
    {
      "id": "A13d09aem22216e94m7581nb9lo",
      "value": false,
    },
    {
      "id": "a7b502m95Ae81e492n112mldo06",
      "value": false,
    },
    {
      "id": "4d61mo91556A2b52e92le710nam",
      "value": false,
    },
    {
      "id": "ml69775ae121bA0mod2294241ne",
      "value": false,
    },
    {
      "id": "o72ae8124ml25md01b5n969Ae21",
      "value": true,
    },
    {
      "id": "21727n9me96m945oda21l6bA01e",
      "value": false,
    },
  ];

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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guidix/core/app_controller/configure.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/models/application_model.dart';
import 'package:guidix/core/models/user/user_info.dart';
import 'package:guidix/core/models/user/user_model.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/theme/custom_theme.dart';
import 'package:guidix/core/utils/cache_helper.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  final box = GetStorage();
  Configure configure = Configure();
  late ApplicationModel appModel = ApplicationModel(
    theme: ApplicationTheme.light,
    language: ApplicationLanguage.en,
    applicationName: kEnglishFontFamily,
    fontFamily: kEnglishFontFamily,
  );
  UserModel? userModel;
  UserInfoModel? userInfoModel;
  bool appValidation = true;
  bool appUpdated = true;

  @override
  void onInit() async {
    validate();
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
    CacheHelper.setSecuerString(
        key: GetStoreageKey.lang,
        value: WidgetsBinding.instance.window.locale.languageCode == "en"
            ? "en-US"
            : "ar-EG");
    getCachedUser();
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
        CacheHelper.setSecuerString(key: GetStoreageKey.lang, value: "en-US");

        appModel.fontFamily = kArabicFontFamily;
        break;
      case ApplicationLanguage.en:
        appModel.language = ApplicationLanguage.ar;
        CacheHelper.setSecuerString(key: GetStoreageKey.lang, value: "ar-EG");

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

  Future<void> cacheUSer(
      {required UserInfoModel userInfo, required UserModel user}) async {
    await setUSer(user: user);
    await setUSerInfo(userInfo: userInfo);
  }

  Future<void> setUSer({required UserModel? user}) async {
    userModel = user;
    await CacheHelper.saveData(
      key: GetStoreageKey.initialRoute,
      value: Routes.mainGuidixScreen,
    );
    var box = Hive.box<UserModel>(GetStoreageKey.userBox);

    await box.clear();
    await box.add(user!);
  }

  Future<void> setUSerInfo({required UserInfoModel? userInfo}) async {
    userInfoModel = userInfo;
    var box = Hive.box<UserInfoModel>(GetStoreageKey.userInfoBox);
    await box.clear();
    await box.add(userInfo!);
    update();
  }

  bool languageAr() {
    return appModel.language == ApplicationLanguage.ar ? true : false;
  }

  void getCachedUser() async {
    var box = Hive.box<UserModel>(GetStoreageKey.userBox);
    if (box.isNotEmpty) {
      userModel = box.getAt(0);
    }
    var box2 = Hive.box<UserInfoModel>(GetStoreageKey.userInfoBox);
    if (box2.isNotEmpty) {
      userInfoModel = box2.getAt(0);
    }
  }

  Future<void> signOut() async {
    userModel = null;
    userInfoModel = null;
    var box = Hive.box<UserModel>(GetStoreageKey.userBox);
    await box.clear();
    var box2 = Hive.box<UserInfoModel>(GetStoreageKey.userInfoBox);
    await box2.clear();

    CacheHelper.setSecuerString(value: "", key: GetStoreageKey.accessToken);
    CacheHelper.setSecuerString(value: "", key: GetStoreageKey.refreshToken);
    await CacheHelper.saveData(
      key: GetStoreageKey.initialRoute,
      value: Routes.loginScreen,
    );
    googleLogout();
    Get.offAllNamed(Routes.loginScreen);
  }

  Future<void> googleLogout() async {
    try {
      await GoogleSignIn().signOut();
    } on Exception catch (_) {}
  }

  void validate() {
    configure.checkAvilability().listen((event) async {
      if (event.exists) {
        var packageInfo = await PackageInfo.fromPlatform();

        var data = event.data();
        printInfo(info: "${packageInfo.version}  $data");
        if (data?["app_virsion"] != packageInfo.version) {
          appUpdated = false;
        } else if (data?["app_avilaility"] == false) {
          appValidation = false;
        } else {
          appUpdated = true;
          appValidation = true;
        }
        update();
      }
    });
  }
}

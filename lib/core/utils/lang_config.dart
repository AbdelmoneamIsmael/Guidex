import 'package:flutter/material.dart';
import 'package:guidix/core/utils/cache_helper.dart';

mixin LangConfig {
  final String english = 'en';
  final String arabic = 'ar';
  Locale local(String local) {
    switch (local) {
      case 'en':
        return const Locale('en');
      case 'ar':
        return const Locale('ar');
      default:
        return const Locale('en');
    }
  }

  Future<Locale> setLocal({required String locale}) async {
    await CacheHelper.saveData(key: 'lang', value: locale);
    return local(locale);
  }

  Future<Locale> getLocal() async {
    String langCode = CacheHelper.getData(key: 'lang') ?? english;
    return local(langCode);
  }

  // AppLocalizations translation(BuildContext context) {
  //   return AppLocalizations.of(context);
  // }
}

import 'package:get_it/get_it.dart';

const String kAppName = "Guidix";
const kArabicFontFamily = "Arial", kEnglishFontFamily = "Inter";
const knotification = "notification";

String kDeviceToken = "";
// const String baseURl = "https://generators.runasp.net";
final getIt = GetIt.instance;

abstract class HiveKeys {}

abstract class GetStoreageKey {
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";

  static const String lang = "lang";
}

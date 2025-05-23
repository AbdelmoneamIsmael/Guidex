import 'package:get_it/get_it.dart';
import 'package:guidix/core/routes/app_routes.dart';

const String kAppName = "Guidix";
const kArabicFontFamily = "Arial", kEnglishFontFamily = "Inter";
const knotification = "notification";
const baseUrl = "https://guidix.runasp.net";
const internalLocalError = 700;
String initialRoute = Routes.loginScreen;


String kDeviceToken = "";
// const String baseURl = "https://generators.runasp.net";
final getIt = GetIt.instance;

abstract class HiveKeys {}

abstract class GetStoreageKey {
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String initialRoute = "initialRoute";

  static const String lang = "lang";
    static const String name = "name";
  static const String image = "image";
  static const String userBox = "userBox";
  
  static const String userInfoBox = "userInfoBox";
  static const String adressBox = "adressBox";
}

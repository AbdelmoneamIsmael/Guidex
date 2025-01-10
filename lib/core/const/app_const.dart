import 'package:get_it/get_it.dart';

const String kAppName = "Generator";
const kFontFamily = "cairo";
const knotification = "notification";
const kSubscriber = "Subscriber";
const kSubscription = "Subscription";
const kInvoice = "Invoice";
const generatorOwner = "GeneratorOwner";
String kDeviceToken = "";
const String baseURl = "https://generators.runasp.net";
final getIt = GetIt.instance;

abstract class HiveKeys {}

abstract class GetStoreageKey {
  ///app language
  static const String lang = "lang";
  static const String loginToken = "token";
  static const String refreshToken = "refreshToken";
  static const String name = "name";
  static const String image = "image";
  static const String userType = "userType";
  static const String username = "username";
  static const String phoneNumber = "phoneNumber";
  static const String userId = "userId";
  static const String storedUserId = "storedUserId";
  static const String firstName = "firstName";
  static const String secondName = "secondName";
  static const String thirdName = "thirdName";
  static const String lastName = "lastName";
  static const String state = "state";
  static const String country = "country";
  static const String city = "city";
  static const String side = "side";
}

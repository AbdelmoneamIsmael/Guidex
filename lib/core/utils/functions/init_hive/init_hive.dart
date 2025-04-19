import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/models/user/user_info.dart';
import 'package:guidix/core/models/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> hiveInitialization() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(UserInfoModelAdapter());


  // /// Hive Boxes
  await Hive.openBox<UserModel>(GetStoreageKey.userBox);
  await Hive.openBox<UserInfoModel>(GetStoreageKey.userInfoBox);
 
}

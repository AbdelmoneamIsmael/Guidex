import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/utils/cache_helper.dart';
import 'package:guidix/core/utils/functions/init_hive/init_hive.dart';
import 'package:guidix/core/utils/functions/initialize_getit/initialize_getit.dart';
import 'package:guidix/core/utils/notification/notification_handeler.dart';
import 'package:guidix/firebase_options.dart';
import 'package:guidix/guidix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(MainErrorScreen(details: details));
  // };
  await initializeApplication();
  await GetStorage.init();

  runApp(DevicePreview(
    // enabled: !kReleaseMode,
    enabled: false,
    builder: (context) => const GuiDixApplication(),
  ));
}

initializeApplication() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await hiveInitialization();
  initializeGetIt();
  await CacheHelper.init();
  initialRoute = await CacheHelper.getData(
        key: GetStoreageKey.initialRoute,
      ) ??
      Routes.loginScreen;

  kDeviceToken = await NotificationHelper.init();
  log(kDeviceToken);
}

class MainErrorScreen extends StatelessWidget {
  const MainErrorScreen({super.key, required this.details});
  final FlutterErrorDetails details;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                Text(details.exceptionAsString()),
                Text(details.stack.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

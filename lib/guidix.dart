import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_bindings.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_pages.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/themes/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GuiDixApplication extends StatelessWidget {
  const GuiDixApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        AppTextStyle.setContext(context);
        return GetBuilder<AppController>(
          init: AppController(),
          builder: (controller) {
            return GetMaterialApp(
              title: "Guidix Application",
              initialBinding: AppBindings(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(controller.langCode),
              smartManagement: SmartManagement.full,
              debugShowCheckedModeBanner: false,
              getPages: AppPages.routes,
              initialRoute: Routes.onBoarding,
              theme: controller.appTheme,
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/features/cart/presentation/screen/cart_screen.dart';
import 'package:guidix/features/communityScreen/presentation/screen/community_screen.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/binding/my_qr_bindings.dart';
import 'package:guidix/features/my_qr_codes/presentation/screen/my_qr_codes_screen.dart';
import 'package:guidix/features/profile_screen/controller_repo/binding/profile_binding.dart';
import 'package:guidix/features/profile_screen/presentation/screen/profile_screen.dart';
import 'package:guidix/features/scan_Screen/controller_repo/binding/scanner_binding.dart';
import 'package:guidix/features/scan_Screen/presentation/screen/scan_screen.dart';

class MainController extends GetxController {
  int currentIndex = 2;
  List screens = [
    Routes.communityScreen,
    Routes.cartScreen,
    Routes.scannerScreen,
    Routes.qrcoodsScreen,
    Routes.profileScreen,
  ];
  void changePage(int index) {
    if (index != currentIndex) {
      currentIndex = index;
      Get.offAllNamed(screens[currentIndex], id: 1);
      update();
    }
  }

  Route onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case Routes.communityScreen:
        return GetPageRoute(
          routeName: Routes.communityScreen,
          settings: settings,
          page: () => const CommunityScreen(),
          // binding: SpecializationBindings(),
          transition: Transition.cupertino,
        );
      case Routes.cartScreen:
        return GetPageRoute(
          routeName: Routes.cartScreen,
          settings: settings,
          page: () => const CartScreen(),
          // binding: SpecializationBindings(),
          transition: Transition.cupertino,
        );
      case Routes.scannerScreen:
        return GetPageRoute(
          routeName: Routes.scannerScreen,
          settings: settings,
          page: () => const ScanScreen(),
          binding: ScannerBinding(),
          transition: Transition.cupertino,
        );
      case Routes.qrcoodsScreen:
        return GetPageRoute(
          routeName: Routes.qrcoodsScreen,
          binding: MyQrBindings(),
          settings: settings,
          page: () => const MyQrCodesScreen(),
          // binding: SpecializationBindings(),
          transition: Transition.cupertino,
        );
      case Routes.profileScreen:
        return GetPageRoute(
          routeName: Routes.profileScreen,
          settings: settings,
          page: () => const ProfileScreen(),
          binding: ProfileBinding(context: context),
          transition: Transition.cupertino,
        );
      default:
        return GetPageRoute(
          routeName: Routes.scannerScreen,
          settings: settings,
          page: () => const ScanScreen(),
          // binding: SpecializationBindings(),
          transition: Transition.cupertino,
        );
    }
  }
}

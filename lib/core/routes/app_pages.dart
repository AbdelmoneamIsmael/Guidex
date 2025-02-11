import 'package:get/get.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/features/add_new_qr/presentation/screen/add_new_qr.dart';
import 'package:guidix/features/all_categories/controller_repo/binding/all_categories_bindings.dart';
import 'package:guidix/features/all_categories/presentation/screen/all_category_page.dart';
import 'package:guidix/features/edit_profile/controller/controller/binndings/edit_profile_bindings.dart';
import 'package:guidix/features/edit_profile/presentation/edit_profile.dart';
import 'package:guidix/features/forget_passord/bindings/forget_pass_bindings.dart';
import 'package:guidix/features/forget_passord/presentation/screens/forget_pass_screen.dart';
import 'package:guidix/features/orders/controller/orders_bindings.dart';
import 'package:guidix/features/orders/presentation/pages/orders_screen.dart';
import 'package:guidix/features/settings/controller_repo/binding/settings_bindings.dart';
import 'package:guidix/features/settings/presentation/screen/settings_screen.dart';
import 'package:guidix/features/login/presentation/binding/login_binding.dart';
import 'package:guidix/features/login/presentation/screen/login_screen.dart';
import 'package:guidix/features/main/controller_repo/binding/main_binding.dart';
import 'package:guidix/features/main/presentation/screen/guidix_main_view.dart';
import 'package:guidix/features/onboarding/pages/onboarding.dart';
import 'package:guidix/features/onboarding/pages/second_onboard_screen.dart';
import 'package:guidix/features/register/presentation/bindning/register_binding.dart';
import 'package:guidix/features/register/presentation/screens/register_Screen.dart';
import 'package:guidix/features/view_qr_details/controller_repo/binding/qrcode_bindings.dart';
import 'package:guidix/features/view_qr_details/presentation/screen/qrcode_details.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.loginScreen;

  static const homePage = Routes.homeScreen;

  static final routes = [
    GetPage(
      name: Routes.onBoarding,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: Routes.onBoarding2,
      page: () => const SecondOnboardScreen(),
    ),
    GetPage(
      name: Routes.registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.forgetPassScreen,
      page: () => const ForgetPassScreen(),
      binding: ForgetPassBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.mainGuidixScreen,
      page: () => const GuidixMainView(),
      binding: MainBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.addNewQr,
      page: () => AddNewQr(
        qrCodeID: Get.arguments as String,
      ),
      binding: MainBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.qrCodeDetails,
      page: () => const QrCodeDetails(),
      binding: QrcodeBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.allCategories,
      page: () => const AllCategoryPage(),
      binding: AllCategoriesBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.settingScreen,
      page: () => const SettingsScreen(),
      binding: SettingsBindings(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfile(),
      transition: Transition.cupertino,
      binding: EditProfileBindings(),
    ),
    GetPage(
      name: Routes.ordersPage,
      page: () => const OrdersScreen(),
      transition: Transition.cupertino,
      binding: OrdersBindings(),
    ),
  ];
}

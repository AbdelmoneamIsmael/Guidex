import 'package:get/get.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/features/login/presentation/binding/login_binding.dart';
import 'package:guidix/features/login/presentation/screen/login_screen.dart';
import 'package:guidix/features/onboarding/presentation/pages/onboarding.dart';
import 'package:guidix/features/register/presentation/bindning/register_binding.dart';
import 'package:guidix/features/register/presentation/screens/register_Screen.dart';

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
      name: Routes.registerScreen,
      page: () => const RegisterScreen(),
      binding:RegisterBinding() ,
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding:LoginBinding() ,
      transition: Transition.cupertino,
    ),
  ];
}

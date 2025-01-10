import 'package:get/get.dart';
import 'package:guidix/features/login/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
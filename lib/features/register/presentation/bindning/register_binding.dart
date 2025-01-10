import 'package:get/get.dart';
import 'package:guidix/features/register/presentation/controller/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
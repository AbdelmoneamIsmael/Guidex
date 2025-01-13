import 'package:get/get.dart';
import 'package:guidix/features/forget_passord/controller/forget_pass_controller.dart';

class ForgetPassBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPassController());
  }
}

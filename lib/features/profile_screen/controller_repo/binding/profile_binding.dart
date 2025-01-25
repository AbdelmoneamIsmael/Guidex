import 'package:get/get.dart';
import 'package:guidix/features/profile_screen/controller_repo/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
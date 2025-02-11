import 'package:get/get.dart';
import 'package:guidix/features/edit_profile/controller/controller/edit_profile_controller.dart';

class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
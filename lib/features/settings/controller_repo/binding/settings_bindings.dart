import 'package:get/get.dart';
import 'package:guidix/features/settings/controller_repo/controller/settings_controller.dart';

class SettingsBindings  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }

}
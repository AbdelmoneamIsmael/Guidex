import 'package:get/get.dart';
import 'package:guidix/features/scan_Screen/controller_repo/controller/scnner_controller.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScnnerController());
  }
}

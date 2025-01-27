import 'package:get/get.dart';
import 'package:guidix/features/view_qr_details/controller_repo/controller/details_controller.dart';

class QrcodeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => QrCodeDetailsController(
        qrCodeModel: Get.arguments["qrCodeModel"],
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/qrcode_repo.dart';
import 'package:guidix/features/scan_Screen/controller_repo/controller/scnner_controller.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScnnerController(
      qrcodeRepo:  getIt.get<QrcodeRepo>(),
    ));
  }
}

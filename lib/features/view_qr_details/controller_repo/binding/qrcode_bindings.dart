import 'package:get/get.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/qrcode_repo.dart';
import 'package:guidix/features/view_qr_details/controller_repo/controller/details_controller.dart';

class QrcodeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => QrCodeDetailsController(
        qrCodeModel: Get.arguments["qrCodeModel"],
        qrcodeRepo: getIt.get<QrcodeRepo>(),
      ),
    );
  }
}

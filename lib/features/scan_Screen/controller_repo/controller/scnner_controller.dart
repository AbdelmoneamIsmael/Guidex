import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/qrcode_repo.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';

class ScnnerController extends GetxController {
  String barCodeValue = "Abdelmoneam";

  ScannerState scannerState = ScannerState.initial;
  QrcodeModel? selectedQrcode;
  final QrcodeRepo qrcodeRepo;

  ScnnerController({
    required this.qrcodeRepo,
  });

  setBarCode() async {
    if (barCodeValue.isNotEmpty) {
      printInfo(info: "barCodeValue: $barCodeValue");
      await getQrCode(barCodeValue);
    }
    update();
  }

  setInitialState() {
    scannerState = ScannerState.initial;
    update();
  }

  
  getQrCode(String barCodeValue) async {
    scannerState = ScannerState.loading;
    update();
    try {
      var result = await qrcodeRepo.getQrCode(code: barCodeValue);
      result.fold((l) {
        scannerState = ScannerState.failNotFound;
        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) {
        update();
        selectedQrcode = r;
        if (r.isReserved == true) {
          scannerState = ScannerState.success;
        } else if (r.isReserved == false) {
          scannerState = ScannerState.notEmplemented;
        } else {
          scannerState = ScannerState.failNotFound;
        }
      });
    } on Exception catch (e) {
      scannerState = ScannerState.failNotFound;
      UIHelper.showSnackbar(context: Get.context!, message: e.toString());
    }
  }
}

enum ScannerState {
  failNotFound,
  notEmplemented,
  initial,
  loading,
  success,
}

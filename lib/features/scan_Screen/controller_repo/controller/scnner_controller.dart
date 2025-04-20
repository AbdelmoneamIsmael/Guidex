import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/models/qrcode_generation.dart';

class ScnnerController extends GetxController {
  String barCodeValue = "Abdelmoneam";

  ScannerState scannerState = ScannerState.initial;
  QrCodeGeenerationModel? selectedQrcode;
  setBarCode(String value) {
    barCodeValue = value;

    if (barCodeValue.isNotEmpty) {
      printInfo(info: value);
      Map<String, dynamic> info = checkIsHavingValues(barCodeValue);
      if (info["id"] == "0") {
        scannerState = ScannerState.failNotFound;
      } else if (info["value"] == false) {
        scannerState = ScannerState.notEmplemented;
      } else {
        selectedQrcode = Get.find<AppController>()
            .qrCodeList
            .where(
              (element) => element.qrCodeId == info["id"],
            )
            .toList()
            .first;
        scannerState = ScannerState.success;
      }
    } else {
      scannerState = ScannerState.initial;
    }
    update();
  }

  setInitialState() {
    scannerState = ScannerState.initial;
    update();
  }

  Map<String, dynamic> checkIsHavingValues(String barCodeValue) {
    for (var element in Get.find<AppController>().ids) {
      if (element["id"] == barCodeValue) {
        return element;
      }
    }
    return {
      "id": "0",
      "value": false,
    };
  }
}

enum ScannerState {
  failNotFound,
  notEmplemented,
  initial,
  loading,
  success,
}

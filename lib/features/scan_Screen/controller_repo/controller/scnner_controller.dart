import 'package:get/get.dart';

class ScnnerController extends GetxController {
  String barCodeValue = "Abdelmoneam";
  ScannerState scannerState = ScannerState.initial;
  setBarCode(String value) {
    barCodeValue = value;
    printInfo(info: barCodeValue);
    if (barCodeValue.isNotEmpty) {
      scannerState = ScannerState.success;
    } else {
      scannerState = ScannerState.initial;
    }
    update();
  }

  setInitialState() {
    scannerState = ScannerState.initial;
    update();
  }
}

enum ScannerState {
  initial,
  loading,
  success,
}

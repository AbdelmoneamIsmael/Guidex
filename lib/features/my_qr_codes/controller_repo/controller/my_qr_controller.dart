import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guidix/core/widgets/ui_helper.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/category_repo.dart';
import 'package:guidix/features/my_qr_codes/controller_repo/repos/qrcode_repo.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';
import 'package:guidix/features/my_qr_codes/data/model/qrcode_model.dart';

class MyQrController extends GetxController {
  MyQrController({
    required this.qrCodeRepo,
  }) {
    getAllqrCodes();
  }
  final QrcodeRepo qrCodeRepo;
  bool isLoading = false;
  List<QrcodeModel> qrCodes = [];
  CategoryModel selectedCategory = CategoryModel.empty();
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  getAllqrCodes() async {
    isLoading = true;
    update();
    try {
      var result = await qrCodeRepo.getAllQrcodes(
        isPagenation: true,
        pageIndex: 1,
        pageSize: 20,
        categoryId: selectedCategory.id == -1 ? null : selectedCategory.id,
        searchKey: searchController.text,
      );
      result.fold((l) {
        isLoading = false;
        update();
        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) {
        isLoading = false;
        update();
        qrCodes = r.data;
      });
    } catch (e) {
      isLoading = false;
      update();
      UIHelper.showSnackbar(context: Get.context!, message: e.toString());
    }
  }

  resetAll() {
    qrCodes.clear();
    getAllqrCodes();
  }

  void deleteQrCode(QrcodeModel qrCode) async {
    try {
      var result = await qrCodeRepo.deleteQrCode(codes: [qrCode.code!]);
      result.fold((l) {
        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) {
        UIHelper.showSnackbar(context: Get.context!, message: r.message!);
        qrCodes.removeWhere((qr) => qr.code == qrCode.code);
        update();
      });
    } catch (e) {
      UIHelper.showSnackbar(context: Get.context!, message: e.toString());
    }
  }
}

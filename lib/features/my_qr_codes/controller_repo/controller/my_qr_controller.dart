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
    scrollController.addListener(_onScroll);
  }
  final QrcodeRepo qrCodeRepo;

  List<QrcodeModel> qrCodes = [];
  CategoryModel selectedCategory = CategoryModel.empty();
  TextEditingController searchController = TextEditingController();
  bool isThereMoreItems = true;
  bool isLoading = false;
  bool isInitialLoading = false;
  int pageIndex = 1;
  ScrollController scrollController = ScrollController();


  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.hasClients) {
      double currentPosition = scrollController.position.pixels;
      double maxScrollExtent = scrollController.position.maxScrollExtent;
      double seventyPercentOffset = maxScrollExtent * 0.7;
      if (currentPosition >= seventyPercentOffset &&
          isThereMoreItems &&
          isLoading == false &&
          isInitialLoading == false) {
        getAllqrCodes();
      }
    }
  }

  getAllqrCodes() async {
    isLoading = true;
    if (qrCodes.isEmpty) {
      isInitialLoading = true;
    }
    update();
    try {
      var result = await qrCodeRepo.getAllQrcodes(
        isPagenation: true,
        pageIndex: pageIndex,
        pageSize: 20,
        categoryId: selectedCategory.id == -1 ? null : selectedCategory.id,
        searchKey: searchController.text,
      );
      result.fold((l) {
        isLoading = false;
        isInitialLoading = false;
        update();
        UIHelper.showSnackbar(context: Get.context!, message: l.message);
      }, (r) {
        isLoading = false;
        isInitialLoading = false;
        update();
        qrCodes.addAll(r.data);
        isThereMoreItems = r.hasNextPage!;
        pageIndex++;
        printInfo(
            info: "page ${r.pageIndex} isThereMoreItems ${r.hasNextPage}");
      });
    } catch (e) {
      isLoading = false;
      isInitialLoading = false;
      update();
      UIHelper.showSnackbar(context: Get.context!, message: e.toString());
    }
  }

  resetAll() {
    qrCodes.clear();
    pageIndex = 1;
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

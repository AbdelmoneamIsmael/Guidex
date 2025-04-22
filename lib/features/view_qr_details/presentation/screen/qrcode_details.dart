import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/loading_over_lay.dart';
import 'package:guidix/features/view_qr_details/controller_repo/controller/details_controller.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class QrCodeDetails extends GetView<QrCodeDetailsController> {
  const QrCodeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrCodeDetailsController>(
        // init:QrCodeDetailsController(qrCodeModel: ) ,
        builder: (controller) {
      return Stack(
        children: [
          Scaffold(
            appBar: GuidixAppBar(
              actions: [
                Semantics(
                  label: AppLocalizations.of(context).saveUpdates,
                  child: IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      controller.applyChanges();
                    },
                  ),
                ),
              ],
              title: AppLocalizations.of(context).qrCodeDetails,
            ),
            // bottomNavigationBar: Container(
            //   color: Theme.of(context).colorScheme.surface,
            //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32).w,
            //   child: PrimaryButton(
            //     hint: "",
            //     title: AppLocalizations.of(context).save,
            //     onPressed: () {},
            //   ),
            // ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16).w,
              child: Column(
                children: [
                  16.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    height: 237.h - 32.h,
                    width: 237.w - 32.w,
                    child: QrcodeWidget(
                      qrCodeID: controller.qrCodeModel.code ?? "",
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  32.verticalSpace,
                  ListTile(
                    onTap: () => controller.selectCategory(),
                    contentPadding: EdgeInsets.zero,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      AppLocalizations.of(context).category,
                      style: AppTextStyle.medium16(context).copyWith(),
                    ),
                    subtitle: Text(
                      controller.qrCodeModel.categoryId == null
                          ? AppLocalizations.of(context).noCategoryYet
                          : Get.find<AppController>().languageAr()
                              ? controller.qrCodeModel.categoryNameAr ?? ""
                              : controller.qrCodeModel.categoryNameEn ?? "",
                      style: AppTextStyle.regular16(context).copyWith(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  AppTextField(
                    controller: controller.nameArController,
                    hintText: AppLocalizations.of(context).nameAR,
                    semanticLabel: AppLocalizations.of(context).nameAR,
                  ),
                  24.verticalSpace,
                  AppTextField(
                    controller: controller.describtionArController,
                    maxLines: 5,
                    hintText: AppLocalizations.of(context).descriptionAR,
                    semanticLabel: AppLocalizations.of(context).descriptionAR,
                  ),
                  24.verticalSpace,
                  AppTextField(
                    controller: controller.nameEnController,
                    hintText: AppLocalizations.of(context).nameEn,
                    semanticLabel: AppLocalizations.of(context).nameEn,
                  ),
                  24.verticalSpace,
                  AppTextField(
                    controller: controller.describtionEnController,
                    maxLines: 5,
                    hintText: AppLocalizations.of(context).descriptionAR,
                    semanticLabel: AppLocalizations.of(context).descriptionEn,
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<QrCodeDetailsController>(builder: (controller) {
            return Visibility(
              visible: controller.isLoading,
              child: const LoadingOverlay(),
            );
          })
        ],
      );
    });
  }
}

class QrcodeWidget extends StatelessWidget {
  const QrcodeWidget({
    super.key,
    required this.qrCodeID,
    this.borderRadius,
  });

  final String qrCodeID;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: SfBarcodeGenerator(
        value: qrCodeID,
        symbology: QRCode(),
        backgroundColor: Colors.white,
        barColor: Colors.black,
      ),
    );
  }
}

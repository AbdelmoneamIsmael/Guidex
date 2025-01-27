import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
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
      return Scaffold(
        appBar: GuidixAppBar(
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
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                height: 237.h - 32.h,
                width: 237.w - 32.w,
                child: QrcodeWidget(
                  qrCodeID: controller.qrCodeModel.id!,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              32.verticalSpace,
              AppTextField(
                hintText: AppLocalizations.of(context).category,
                controller: controller.categoryController,
                semanticLabel: "semanticLabel",
              ),
              24.verticalSpace,
              AppTextField(
                controller: controller.nameController,
                hintText: AppLocalizations.of(context).name,
                semanticLabel: AppLocalizations.of(context).name,
              ),
              24.verticalSpace,
              AppTextField(
                controller: controller.describtionController,
                maxLines: 5,
                hintText: AppLocalizations.of(context).description,
                semanticLabel: AppLocalizations.of(context).description,
              ),
            ],
          ),
        ),
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

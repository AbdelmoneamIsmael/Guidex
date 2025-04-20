import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/models/qrcode_generation.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/add_new_qr/presentation/screen/add_new_qr.dart';
import 'package:guidix/features/scan_Screen/controller_repo/controller/scnner_controller.dart';
import 'package:guidix/features/scan_Screen/presentation/screen/scan_code.dart';
import 'package:guidix/gen/assets.gen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ScanScreen extends GetView<ScnnerController> {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScnnerController>(
      init: ScnnerController(),
      builder: (controller) {
        return Scaffold(
          appBar: GuidixAppBar(
            title: AppLocalizations.of(context).scanQr,
            applyLeading: false,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Column(
              children: [
                24.verticalSpace,
                Container(
                  padding: const EdgeInsets.all(8).w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).bottomAppBarTheme.color,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleOption(
                        hint: AppLocalizations.of(context).scanQrCodeWithFlash,
                        onPresss: () {
                          Get.to(BarcodeScannerWithScanWindow(
                            controller: MobileScannerController(
                              torchEnabled: true,
                            ),
                          ));
                        },
                        svg: Assets.icons.flash,
                      ),
                      const Expanded(child: SizedBox()),
                      CircleOption(
                        hint:
                            AppLocalizations.of(context).scanQrCodeWithoutFlash,
                        onPresss: () {
                          Get.to(BarcodeScannerWithScanWindow(
                            controller: MobileScannerController(
                              torchEnabled: false,
                            ),
                          ));
                        },
                        svg: Assets.icons.removeSlash,
                      ),
                      const Expanded(child: SizedBox()),
                      CircleOption(
                        hint: AppLocalizations.of(context).refresh,
                        onPresss: () {
                          controller.setInitialState();
                        },
                        svg: Assets.icons.refresh,
                      ),
                    ],
                  ),
                ),
                59.verticalSpace,
                controller.scannerState == ScannerState.initial
                    ? const InitialSCreen()
                    : controller.scannerState == ScannerState.success
                        ? const SuccessScanScreen()
                        : controller.scannerState == ScannerState.notEmplemented
                            ? const SuccessScanNoValueScreen()
                            : Center(
                                child: Text(
                                  AppLocalizations.of(context).notfoundQrCode,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.medium20(context)
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                59.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}

class SuccessScanNoValueScreen extends GetView<ScnnerController> {
  const SuccessScanNoValueScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScnnerController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              children: [
                QrcodeWidget(
                  qrCodeID: controller.barCodeValue,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: UnconstrainedBox(
                    child: Container(
                      color: Colors.white,
                      width: 50.w,
                      height: 15.h,
                      child: SvgPicture.asset(
                        width: 50.w,
                        Assets.icons.appLogo,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          42.verticalSpace,
          Text(
            AppLocalizations.of(context).newQrCode,
            style: AppTextStyle.medium20(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          16.verticalSpace,
          PrimaryButton(
            title: AppLocalizations.of(context).addNew,
            onPressed: () {
              Get.toNamed(
                Routes.qrCodeDetails,
                arguments: {
                  "qrCodeModel": QrCodeGeenerationModel(
                    qrCodeId: controller.barCodeValue,
                    nameEn: "",
                    nameAr: "",
                    describtonEn: "",
                    descriptionAr: "",
                  ),
                },
              )!
                  .then((value) =>
                      controller.setBarCode(controller.barCodeValue));
            },
          ),
        ],
      );
    });
  }
}

class SuccessScanScreen extends GetView<ScnnerController> {
  const SuccessScanScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScnnerController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Stack(
              children: [
                QrcodeWidget(
                  qrCodeID: controller.barCodeValue,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: UnconstrainedBox(
                    child: Container(
                      color: Colors.white,
                      width: 50.w,
                      height: 15.h,
                      child: SvgPicture.asset(
                        width: 50.w,
                        Assets.icons.appLogo,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          42.verticalSpace,
          Text(
            Get.locale == const Locale("en")
                ? controller.selectedQrcode!.nameAr!
                : controller.selectedQrcode!.nameEn!,
            style: AppTextStyle.medium20(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          16.verticalSpace,
          PrimaryButton(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            forGroundColor: Theme.of(context).primaryColor,
            title: AppLocalizations.of(context).viewDetails,
            onPressed: () {
              Get.toNamed(Routes.qrCodeDetails, arguments: {
                "qrCodeModel": controller.selectedQrcode,
              })!
                  .then(
                (value) => controller.setBarCode(
                  controller.barCodeValue,
                ),
              );
            },
          )
        ],
      );
    });
  }
}

class InitialSCreen extends GetView<ScnnerController> {
  const InitialSCreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(Assets.icons.scanCodeBorder),
          Padding(
            padding: const EdgeInsets.all(48).w,
            child: Stack(
              children: [
                SfBarcodeGenerator(
                  value: 'Abdelmoneam',
                  symbology: QRCode(),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: UnconstrainedBox(
                    child: Container(
                      color: Colors.white,
                      width: 100.w,
                      height: 30.h,
                      child: SvgPicture.asset(
                        width: 100.w,
                        Assets.icons.appLogo,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleOption extends StatelessWidget {
  const CircleOption({
    super.key,
    required this.svg,
    required this.onPresss,
    this.padding,
    this.color,
    required this.hint,
  });
  final String svg;
  final VoidCallback onPresss;
  final double? padding;
  final Color? color;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      hint: hint,
      label: AppLocalizations.of(context).scanQr,
      child: GestureDetector(
        onTap: onPresss,
        child: Container(
          padding: EdgeInsets.all(padding ?? 4),
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: SvgPicture.asset(
            svg,
            width: 24.w,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              color ?? Theme.of(context).textTheme.bodyMedium!.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

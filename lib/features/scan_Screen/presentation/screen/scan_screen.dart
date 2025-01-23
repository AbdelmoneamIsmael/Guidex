import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
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
          body: Padding(
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
                      ScanOptions(
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
                      ScanOptions(
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
                      ScanOptions(
                        onPresss: () {
                          controller.setInitialState();
                        },
                        svg: Assets.icons.refresh,
                      ),
                    ],
                  ),
                ),
                59.verticalSpace,
                controller.scannerState != ScannerState.initial
                    ? Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(Assets.icons.scanCodeBorder),
                            Padding(
                              padding: const EdgeInsets.all(48).w,
                              child: SfBarcodeGenerator(
                                value: 'Abdelmoneam',
                                symbology: QRCode(),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: QrcodeWidget(
                              qrCodeID: controller.barCodeValue,
                            ),
                          ),
                          42.verticalSpace,
                          PrimaryButton(
                            title: AppLocalizations.of(context).addNew,
                            hint: "hint",
                            onPressed: () {
                              Get.toNamed(
                                Routes.addNewQr,
                                arguments: controller.barCodeValue,
                              );
                            },
                          ),
                          16.verticalSpace,
                          PrimaryButton(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            forGroundColor: Theme.of(context).primaryColor,
                            title: AppLocalizations.of(context).viewDetails,
                            hint: "hint",
                            onPressed: () {},
                          )
                        ],
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

class ScanOptions extends StatelessWidget {
  const ScanOptions({
    super.key,
    required this.svg,
    required this.onPresss,
  });
  final String svg;
  final VoidCallback onPresss;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPresss,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SvgPicture.asset(
          svg,
          width: 24.w,
          colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn),
        ),
      ),
    );
  }
}

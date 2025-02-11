import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class AddNewQr extends StatelessWidget {
  const AddNewQr({super.key, required this.qrCodeID});
  final String qrCodeID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).newQrCode,
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32).w,
        child: PrimaryButton(
          title: AppLocalizations.of(context).save,
          onPressed: () {},
        ),
      ),
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
                qrCodeID: qrCodeID,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            32.verticalSpace,
            AppTextField(
              hintText: AppLocalizations.of(context).category,
              semanticLabel: "semanticLabel",
            ),
            24.verticalSpace,
            AppTextField(
              hintText: AppLocalizations.of(context).name,
              semanticLabel: "semanticLabel",
            ),
            24.verticalSpace,
            AppTextField(
              maxLines: 5,
              hintText: AppLocalizations.of(context).description,
              semanticLabel: "semanticLabel",
            ),
          ],
        ),
      ),
    );
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

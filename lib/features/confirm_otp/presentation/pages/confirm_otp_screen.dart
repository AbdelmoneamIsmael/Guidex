import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/loading_over_lay.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/confirm_otp/presentation/controller/confirm_otp_controller.dart';

class ConfirmOtpScreen extends GetView<ConfirmOtpController> {
  const ConfirmOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar:
              GuidixAppBar(title: AppLocalizations.of(context).verifyYourEmail),
          body: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  32.verticalSpace,
                  Text(
                    AppLocalizations.of(context).enteringTheCode,
                    style: AppTextStyle.regular16(context),
                    textAlign: TextAlign.center,
                  ),
                  24.verticalSpace,
                  GuidixFormField(
                    controller: controller.codeController,
                    hintText: "Code",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).fieldRequired;
                      }
                      return null;
                    },
                    semanticLabel: "Code Input Field",
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                  44.93.verticalSpace,
                  Text(
                    AppLocalizations.of(context).recevivingTheCode,
                    style: AppTextStyle.regular16(context).copyWith(
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                  16.verticalSpace,
                  GestureDetector(
                    onTap: () => controller.resendOtp(),
                    child: Text(
                      AppLocalizations.of(context).resendCode,
                      style: AppTextStyle.simiBold16(context),
                    ),
                  ),
                  44.07.verticalSpace,
                  PrimaryButton(
                    title: AppLocalizations.of(context).verify,
                    onPressed: () => controller.onVerify(),
                  )
                ],
              ),
            ),
          ),
        ),
        GetBuilder<ConfirmOtpController>(builder: (context) {
          return Visibility(
            visible: controller.isLoading,
            child: const LoadingOverlay(),
          );
        })
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/forget_passord/controller/forget_pass_controller.dart';

class EnterCode extends StatelessWidget {
  const EnterCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        32.verticalSpace,
        Text(
          AppLocalizations.of(context).enteringTheCode,
          style: AppTextStyle.regular16(context),
          textAlign: TextAlign.center,
        ),
        24.verticalSpace,
        GuidixFormField(
          semanticHint: "Type your code",
          hintText: "Code",
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
        Text(
          AppLocalizations.of(context).resendCode,
          style: AppTextStyle.simiBold16(context),
        ),
        44.07.verticalSpace,
        PrimaryButton(
          hint: "Navigate to next step",
          title:  AppLocalizations.of(context).verify,
          onPressed: () => Get.find<ForgetPassController>().nextStep(),
        )
      ],
    );
  }
}

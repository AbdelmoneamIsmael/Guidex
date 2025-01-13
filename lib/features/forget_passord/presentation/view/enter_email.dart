import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/forget_passord/controller/forget_pass_controller.dart';
import 'package:guidix/gen/assets.gen.dart';

class EnterEmail extends StatelessWidget {
  const EnterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        48.verticalSpace,
        SvgPicture.asset(
          Assets.icons.lockWindow,
        ),
        48.verticalSpace,
        Text(
          "Enter your email address",
          style: AppTextStyle.regular16,
        ),
        23.73.verticalSpace,
        AppTextField(
          hintText: "Email",
          semanticLabel: "Email Input Field",
          semanticHint: "Enter your email address",
          controller: Get.find<ForgetPassController>().emailController,
          prefixIcon: const Icon(Icons.email),
        ),
        32.verticalSpace,
        PrimaryButton(
          hint: "Navigate to next step",
          title: "Send",
          onPressed: () => Get.find<ForgetPassController>().nextStep(),
        )
      ],
    );
  }
}
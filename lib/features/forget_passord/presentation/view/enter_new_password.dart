import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/forget_passord/controller/forget_pass_controller.dart';
import 'package:guidix/gen/assets.gen.dart';

class EnterNewPassword extends GetView<ForgetPassController> {
  const EnterNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        48.verticalSpace,
        SvgPicture.asset(
          Assets.icons.unlockWindow,
          width: 236.w,
        ),
        48.verticalSpace,
        GetBuilder<ForgetPassController>(
          builder: (context) {
            return AppTextField(
              hintText: "Password",
              semanticLabel: "Password Input Field",
              controller: controller.passwordController,
              obscureText: controller.isPasswordSecure,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.changePasswordSecure();
                },
                icon: controller.isPasswordSecure
                    ? const Icon(Icons.visibility_off_sharp)
                    : const Icon(Icons.visibility),
              ),
            );
          },
        ),
        32.verticalSpace,
        GetBuilder<ForgetPassController>(
          builder: (context) {
            return AppTextField(
              hintText: "Confirm Password",
              semanticLabel: "Confirm Password Input Field",
              controller: controller.rePasswordController,
              obscureText: controller.isRePasswordSecure,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.changeRePasswordSecure();
                },
                icon: controller.isRePasswordSecure
                    ? const Icon(Icons.visibility_off_sharp)
                    : const Icon(Icons.visibility),
              ),
            );
          },
        ),
        32.verticalSpace,
        PrimaryButton(
          title: AppLocalizations.of(context).save,
          onPressed: () => controller.nextStep(),
        ),
      ],
    );
  }
}

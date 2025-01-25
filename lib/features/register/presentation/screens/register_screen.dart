import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/register/presentation/controller/register_controller.dart';
import 'package:guidix/gen/assets.gen.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).creatAnAccount,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          children: [
            AppTextField(
              controller: controller.nameController,
              hintText: "Full Name",
              semanticLabel: "Enter your Full Name",
              semanticHint: "Enter your  Full Name",
              prefixIcon: const Icon(Icons.person),
            ),
            16.verticalSpace,
            AppTextField(
              controller: controller.emailController,
              hintText: "Email",
              semanticLabel: "Enter your email",
              semanticHint: "Email Input Field",
              prefixIcon: const Icon(Icons.email),
            ),
            16.verticalSpace,
            GetBuilder<RegisterController>(builder: (controller) {
              return AppTextField(
                controller: controller.passwordController,
                hintText: "Password",
                obscureText: controller.passowrdVisible,
                semanticLabel: "Enter your Passowrd",
                semanticHint: "Password Input Field",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: Semantics(
                  label: " Password",
                  hint: "change  password visibility",
                  button: true,
                  value: controller.passowrdVisible.toString(),
                  checked: controller.passowrdVisible,
                  obscured: controller.passowrdVisible,
                  child: GestureDetector(
                    onTap: () {
                      controller.changePasswordVisibility();
                    },
                    child: controller.passowrdVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              );
            }),
            16.verticalSpace,
            GetBuilder<RegisterController>(builder: (controller) {
              return AppTextField(
                controller: controller.confirmPasswordController,
                obscureText: controller.confirmPasswordVisible,
                hintText: "Confirm Password",
                semanticLabel: "Confirm your Passowrd",
                semanticHint: "Confirm Password Input Field",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: Semantics(
                  label: "Confirm Password",
                  hint: "change Confirm password visibility",
                  button: true,
                  value: controller.confirmPasswordVisible.toString(),
                  checked: controller.confirmPasswordVisible,
                  obscured: controller.confirmPasswordVisible,
                  child: GestureDetector(
                    onTap: () {
                      controller.changeConfirmPasswordVisibility();
                    },
                    child: controller.confirmPasswordVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              );
            }),
            16.verticalSpace,
            PrimaryButton(
              onPressed: () {},
              title: AppLocalizations.of(context).signUp,
              hint: "Double tap to sign Up",
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(thickness: 1),
                ),
                const SizedBox(width: 12),
                Text(
                  AppLocalizations.of(context).or,
                  style: AppTextStyle.medium16(context),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Divider(thickness: 1),
                ),
              ],
            ),
            24.verticalSpace,
            SocialButton(
              label: AppLocalizations.of(context).continueWithGoogle,
              hint: "by clicking on this button you can sign up with google",
              onPressed: () {},
              icon: Assets.icons.google,
            ),
            16.verticalSpace,
            SocialButton(
              label: AppLocalizations.of(context).continueWithFacebook,
              hint: "by clicking on this button you can sign up with Facebook",
              onPressed: () {},
              icon: Assets.icons.facebook,
            ),
            32.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context).alreadyHaveAnAccount,
                    style: AppTextStyle.medium16(context),
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.loginScreen);
                      },
                      child: Text(
                        " ${AppLocalizations.of(context).signIn}",
                        style: AppTextStyle.bold16(context).copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

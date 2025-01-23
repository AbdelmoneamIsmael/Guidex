import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/app_texts/app_localizations_ar.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/login/presentation/controller/login_controller.dart';
import 'package:guidix/gen/assets.gen.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).welcomeBack,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          children: [
            AppTextField(
              controller: controller.emailController,
              hintText: "Email Adress",
              semanticLabel: "Enter your Email Adress",
              semanticHint: "Enter your  Email Adress",
              prefixIcon: const Icon(Icons.person),
            ),
            16.verticalSpace,
            GetBuilder<LoginController>(
              builder: (controller) {
                return AppTextField(
                  controller: controller.passwordController,
                  hintText: "Password",
                  obscureText: controller.passwordSecure,
                  semanticLabel: "Enter your Passowrd",
                  semanticHint: "Password Input Field",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: Semantics(
                    label: " Password",
                    hint: "change  password visibility",
                    button: true,
                    value: controller.passwordSecure.toString(),
                    checked: controller.passwordSecure,
                    obscured: controller.passwordSecure,
                    child: GestureDetector(
                      onTap: () {
                        controller.changePasswordSecure();
                      },
                      child: controller.passwordSecure
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                );
              },
            ),
            8.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.forgetPassScreen);
                },
                child: Text(
                  AppLocalizations.of(context).forgotPassword,
                  style: AppTextStyle.medium14,
                ),
              ),
            ),
            32.verticalSpace,
            PrimaryButton(
              onPressed: () {
                Get.offAllNamed(Routes.mainGuidixScreen);
              },
              title: AppLocalizations.of(context).signIn,
              hint: "Double tap to sign In",
            ),
            32.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(thickness: 1),
                ),
                const SizedBox(width: 12),
                Text(
                  AppLocalizations.of(context).or,
                  style: AppTextStyle.medium16,
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
                style: AppTextStyle.medium16,
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context).donotHaveAnAccount,
                    style: AppTextStyle.medium16,
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.registerScreen);
                      },
                      child: Text(
                        " ${AppLocalizations.of(context).signUp}",
                        style: AppTextStyle.bold16.copyWith(
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

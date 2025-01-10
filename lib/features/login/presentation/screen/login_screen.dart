import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/core/helper/responsive_helper.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/login/presentation/controller/login_controller.dart';
import 'package:guidix/gen/assets.gen.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Semantics(
          label: "Back Button",
          hint: "click to go back to previous screen",
          button: true,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Semantics(
          label: "sign in Screen",
          hint: "in this screen you can Login to your account",
          child: const Text("Welcome Back!"),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(
              controller: controller.emailController,
              hintText: "Email Adress",
              semanticLabel: "Enter your Email Adress",
              semanticHint: "Enter your  Email Adress",
              prefixIcon: const Icon(Icons.person),
            ),
            GetBuilder<LoginController>(builder: (controller) {
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
            }),
            24.verticalSpace(context),
            PrimaryButton(
              onPressed: () {},
              title: "Sign In",
              lable: "Sign In Navigation Button",
              hint: "Double tap to sign In",
            ),
            24.verticalSpace(context),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(thickness: 1),
                ),
                SizedBox(width: 12),
                Text("Or"),
                SizedBox(width: 12),
                Expanded(
                  child: Divider(thickness: 1),
                ),
              ],
            ),
            24.verticalSpace(context),
            SocialButton(
              label: "Continue With Google",
              hint: "by clicking on this button you can sign up with google",
              onPressed: () {},
              icon: Assets.icons.google,
            ),
            16.verticalSpace(context),
            SocialButton(
              label: "Continue With Facebook",
              hint: "by clicking on this button you can sign up with Facebook",
              onPressed: () {},
              icon: Assets.icons.facebook,
            ),
            30.verticalSpace(context),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.registerScreen);
                      },
                      child: Text(
                        "  Sign Up",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/const/app_const.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/loading_over_lay.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/features/login/data/model/sign_in_model.dart';
import 'package:guidix/features/login/data/remote/google_login.dart';
import 'package:guidix/features/login/data/repo/sign_with_email.dart';
import 'package:guidix/features/login/data/repo/sign_with_google_repo.dart';
import 'package:guidix/features/login/presentation/controller/login_controller.dart';
import 'package:guidix/features/login/repo/login_repo.dart';
import 'package:guidix/gen/assets.gen.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Stack(
        children: [
          Scaffold(
            appBar: GuidixAppBar(
              title: AppLocalizations.of(context).welcomeBack,
            ),
            body: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    AppTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context).emailHint;
                        }
                        return null;
                      },
                      controller: controller.emailController,
                      hintText: AppLocalizations.of(context).email,
                      semanticLabel: "Enter your Email Adress",
                      prefixIcon: const Icon(Icons.person),
                    ),
                    16.verticalSpace,
                    GetBuilder<LoginController>(
                      builder: (controller) {
                        return AppTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context).password;
                            }
                            return null;
                          },
                          controller: controller.passwordController,
                          hintText: AppLocalizations.of(context).password,
                          obscureText: controller.passwordSecure,
                          semanticLabel: "Enter your Passowrd",
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
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
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
                          style: AppTextStyle.medium14(context),
                        ),
                      ),
                    ),
                    32.verticalSpace,
                    PrimaryButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.login(
                            context: context,
                            signinRepo: SignWithEmail(
                              signInModel: LoginPrameters(
                                username: controller.emailController.text,
                                password: controller.passwordController.text,
                                fcmToken: kDeviceToken,
                              ),
                            ),
                            getUserInfo: getIt.get<GetUserInfoRepo>(),
                          );
                        }
                      },
                      title: AppLocalizations.of(context).signIn,
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
                      hint:
                          "by clicking on this button you can sign up with google",
                      onPressed: () {
                         controller.login(
                                context: context,
                                getUserInfo: getIt.get<GetUserInfoRepo>(),
                                signinRepo: SignWithGoogleRepo(
                                  googleLogin: GoogleLogin(),
                                ),
                              );
                      },
                      icon: Assets.icons.google,
                    ),
                    // 16.verticalSpace,
                    // SocialButton(
                    //   label: AppLocalizations.of(context).continueWithFacebook,
                    //   hint: "by clicking on this button you can sign up with Facebook",
                    //   onPressed: () {},
                    //   icon: Assets.icons.facebook,
                    // ),
                    32.verticalSpace,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyle.medium16(context),
                        children: [
                          TextSpan(
                            text:
                                AppLocalizations.of(context).donotHaveAnAccount,
                            style: AppTextStyle.medium16(context),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.registerScreen);
                              },
                              child: Text(
                                " ${AppLocalizations.of(context).signUp}",
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
            ),
          ),
          Visibility(
            visible: controller.isLoading,
            child: const LoadingOverlay(),
          ),
        ],
      );
    });
  }
}

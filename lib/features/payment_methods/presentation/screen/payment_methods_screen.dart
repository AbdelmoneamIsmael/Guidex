import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';
import 'package:guidix/gen/assets.gen.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16).w,
        decoration: ShapeDecoration(
          color: Theme.of(context).bottomAppBarTheme.color!,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.w,
              color: Theme.of(context).bottomAppBarTheme.color!,
            ),
          ),
        ),
        child: PrimaryButton(
            title: AppLocalizations.of(context).add, onPressed: () {}),
      ),
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).paymentMethod,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16).w,
        children: [
          PaymentMethodWidget(
            title: AppLocalizations.of(context).instapay,
            icon: Assets.icons.instapay,
          ),
          24.verticalSpace,
          PaymentMethodWidget(
            title: AppLocalizations.of(context).vodafoneCash,
            icon: Assets.icons.vodafoneCash,
          ),
          24.verticalSpace,
          PaymentMethodWidget(
            title: AppLocalizations.of(context).visa,
            icon: Assets.icons.visa,
          ),
        ],
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget(
      {super.key, required this.title, required this.icon});
  final String title, icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(
            width: 1.w,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
          ),
          16.horizontalSpace,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: AppTextStyle.simiBold16(context),
            ),
          ]),
        ],
      ),
    );
  }
}

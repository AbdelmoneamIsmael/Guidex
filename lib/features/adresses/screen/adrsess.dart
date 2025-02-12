import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/core/widgets/primary_button.dart';

class AdressesScreen extends StatelessWidget {
  const AdressesScreen({super.key});

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
            title: AppLocalizations.of(context).addNewAddress,
            onPressed: () {}),
      ),
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).myAddresses,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        children: const [
          AdressCardWidget(
            title: "Home",
          ),
          SizedBox(
            height: 16,
          ),
          AdressCardWidget(
            title: "Club",
          ),
          SizedBox(
            height: 16,
          ),
          AdressCardWidget(
            title: "Company",
          ),
          SizedBox(
            height: 16,
          ),
          AdressCardWidget(
            title: "Other",
          ),
        ],
      ),
    );
  }
}

class AdressCardWidget extends StatelessWidget {
  const AdressCardWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16).w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6).r,
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              10.horizontalSpace,
              Text(title, style: AppTextStyle.medium16(context)),
            ],
          ),
          16.verticalSpace,
          Text(
            "27 Gamal Abd El Nasser street, Qism EL Montaza, Miami, Alexandria",
            style: AppTextStyle.regular16h24(context),
          ).paddingOnly(left: 16.w),
          16.verticalSpace,
          Row(
            children: [
              Text(
                "Phone Number",
                style: AppTextStyle.regular16h24(context),
              ).paddingOnly(left: 16.w),
              Text(
                " : ",
                style: AppTextStyle.regular16h24(context),
              ),
              Text(
                "01122344222",
                style: AppTextStyle.regular16h24(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

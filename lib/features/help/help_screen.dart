import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/app_texts/app_localizations_ar.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(title: AppLocalizations.of(context).help),
      body: ListView(
        padding: const EdgeInsets.all(16).w,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Text(
            AppLocalizations.of(context).howToScan,
            style: AppTextStyle.medium18(context),
          ),
          16.verticalSpace,
          Text(
            AppLocalizations.of(context).howToScanHint,
            style: AppTextStyle.regular16(context),
          ).paddingOnly(left: 16.w),
          24.verticalSpace,
          Text(
            AppLocalizations.of(context).howToBuy,
            style: AppTextStyle.medium18(context),
          ),
          16.verticalSpace,
          Text(
            AppLocalizations.of(context).howToBuyHint,
            style: AppTextStyle.regular16(context),
          ).paddingOnly(left: 16.w),
          24.verticalSpace,
          Text(
            AppLocalizations.of(context).howToEdit,
            style: AppTextStyle.medium18(context),
          ),
          16.verticalSpace,
          Text(
            AppLocalizations.of(context).howToEditHint,
            style: AppTextStyle.regular16(context),
          ).paddingOnly(left: 16.w),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/routes/app_routes.dart';
import 'package:guidix/core/themes/colors/colors.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/app_textfield.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/features/add_new_qr/presentation/screen/add_new_qr.dart';
import 'package:guidix/features/scan_Screen/presentation/screen/scan_screen.dart';
import 'package:guidix/gen/assets.gen.dart';

class MyQrCodesScreen extends StatelessWidget {
  const MyQrCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).myQrCode,
        actions: [
          // option
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).w,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: GuidixFormField(
                hintText: AppLocalizations.of(context).search,
                semanticLabel: "semanticLabel",
                semanticHint: "semanticHint",
                prefixIcon: SvgPicture.asset(
                  Assets.icons.search,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 24).h,
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).category,
                      style: AppTextStyle.medium16,
                    ),
                    Text(
                      " : ",
                      style: AppTextStyle.medium16,
                    ),
                    Text(
                      "Clothes",
                      style: AppTextStyle.regular16,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.allCategories);
                      },
                      child: Text(
                        AppLocalizations.of(context).seeAll,
                        style: AppTextStyle.regular16.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList.separated(
                itemBuilder: (context, index) => const QrCodeItem(),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: 10),
          ],
        ),
      ),
    );
  }
}

class QrCodeItem extends StatelessWidget {
  const QrCodeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarTheme.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7).w,
        child: Row(
          children: [
            SizedBox(
              height: 69.h,
              width: 65.w,
              child: const QrcodeWidget(
                qrCodeID: "abdelmoneam",
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            9.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text(
                  "Dress",
                  style: AppTextStyle.simiBold16,
                ),
                Text(
                  "Clothes",
                  style: AppTextStyle.regular16,
                ),
                Text(
                  "Dress",
                  style: AppTextStyle.regular16.copyWith(
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CircleOption(
              padding: 7,
              svg: Assets.icons.delete,
              color: LightColors.redColor,
              onPresss: () {},
            ),
          ],
        ),
      ),
    );
  }
}

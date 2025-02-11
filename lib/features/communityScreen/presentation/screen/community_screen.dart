import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/gen/assets.gen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(
        title: AppLocalizations.of(context).community,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CommunityOptionWidget(
                    title: AppLocalizations.of(context).community,
                    icon: Assets.icons.community,
                    forGroundColor: Theme.of(context).scaffoldBackgroundColor,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                24.horizontalSpace,
                Expanded(
                  child: CommunityOptionWidget(
                    title: AppLocalizations.of(context).chat,
                    icon: Assets.icons.chat,
                    forGroundColor:
                        Theme.of(context).textTheme.bodyMedium!.color!,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
            47.verticalSpace,
            Text(
              AppLocalizations.of(context).communitySoon,
              style: AppTextStyle.regular16(context).copyWith(
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            47.verticalSpace,
            SvgPicture.asset(
              Assets.icons.communityInfo,
              fit: BoxFit.scaleDown,
            ),
            47.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class CommunityOptionWidget extends StatelessWidget {
  const CommunityOptionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.forGroundColor,
    required this.backgroundColor,
  });
  final String title, icon;
  final Color forGroundColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          side: BorderSide(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              forGroundColor,
              BlendMode.srcIn,
            ),
          ),
          8.horizontalSpace,
          Text(
            title,
            style: AppTextStyle.simiBold16(context).copyWith(
              color: forGroundColor,
            ),
          ),
        ],
      ),
    );
  }
}

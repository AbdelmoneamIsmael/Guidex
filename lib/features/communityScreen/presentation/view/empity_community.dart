import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/features/communityScreen/presentation/widget/community_option_widget.dart';
import 'package:guidix/gen/assets.gen.dart';

class EmpityCommunityView extends StatelessWidget {
  const EmpityCommunityView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
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
    );
  }
}

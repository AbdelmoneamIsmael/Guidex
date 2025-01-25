import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/app_texts/app_localizations_ar.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/features/profile_screen/presentation/widget/profile_option_widget.dart';
import 'package:guidix/gen/assets.gen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuidixAppBar(title: AppLocalizations.of(context).settings),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.blueSettingSvg,
            ),
            48.verticalSpace,
            ProfileOptionWidget(
              title: AppLocalizations.of(context).lightMode,
              icon: Assets.icons.sun,
            ),
            24.verticalSpace,
            ProfileOptionWidget(
              title: AppLocalizations.of(context).darkMode,
              icon: Assets.icons.darkMood,
            ),
            24.verticalSpace,
            ProfileOptionWidget(
              title: AppLocalizations.of(context).inverterTheme,
              icon: Assets.icons.inverter,
            ),
            24.verticalSpace,
            ProfileOptionWidget(
              title: AppLocalizations.of(context).arabic,
              icon: Assets.icons.language,
            ),
            24.verticalSpace,
            ProfileOptionWidget(
              title: AppLocalizations.of(context).signOut,
              icon: Assets.icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}

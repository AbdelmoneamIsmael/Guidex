import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/gen/assets.gen.dart';

class AppNotAvailable extends StatelessWidget {
  const AppNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4,
        sigmaY: 4,
      ),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withValues(alpha: 0.65),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(22),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    16.verticalSpace,
                    Text(
                      AppLocalizations.of(context).appNotAvailableTitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.simiBold16(context),
                    ),
                    16.verticalSpace,
                    Text(
                      AppLocalizations.of(context).appNotAvailableMessage,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.regular12(context).copyWith(),
                    ).paddingAll(20.w),
                    Expanded(
                      child: CircleAvatar(
                        radius: 300.r,
                        backgroundColor:
                            Theme.of(context).bottomAppBarTheme.color,
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: SvgPicture.asset(
                            Assets.icons.maintance,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor,
                              BlendMode.srcIn,
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

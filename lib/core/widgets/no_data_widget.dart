import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
  });
  final String iconPath, title, description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarTheme.color,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              height: 55.h,
              width: 55.w,
              padding: const EdgeInsets.all(14).w,
              child: SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.bold16(context).copyWith(
                fontSize: 20.sp,
                letterSpacing: -0.9,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).w,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyle.regular14(context).copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

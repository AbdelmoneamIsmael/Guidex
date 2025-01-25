import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/gen/assets.gen.dart';

class ProfileOptionWidget extends StatelessWidget {
  const ProfileOptionWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.leadingWidget,
  });
  final String title, icon;
  final VoidCallback? onTap;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12).w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: Theme.of(context).textTheme.bodyMedium!.color!),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
            ),
            8.horizontalSpace,
            Text(
              title,
              style: AppTextStyle.regular16,
            ),
            const Spacer(),
            leadingWidget ??
                SvgPicture.asset(
                  Assets.icons.forwardIos,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                )
          ],
        ),
      ),
    );
  }
}

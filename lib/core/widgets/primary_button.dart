import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    this.onPressed,
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
  });
  final void Function()? onPressed;
  final String label, hint, icon;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).textTheme.bodyMedium!.color!,
            ),
          ),
          textStyle: AppTextStyle.regular16(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            8.horizontalSpace,
            Text(
              label,
            ),
          ],
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.forGroundColor,
  });
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor, forGroundColor;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: forGroundColor,
          shape: StadiumBorder(
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}

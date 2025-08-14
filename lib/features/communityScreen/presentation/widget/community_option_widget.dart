import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';

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

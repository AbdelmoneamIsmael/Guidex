import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15, bottom: 24).w,
      padding: EdgeInsets.symmetric(horizontal: 14.5.w, vertical: 8.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.w,
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyle.medium16(context),
      ),
    );
  }
}

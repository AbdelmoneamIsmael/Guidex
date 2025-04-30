import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guidix/core/app_controller/app_controller.dart';
import 'package:guidix/core/models/application_model.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });
  final CategoryModel category;
  final VoidCallback? onTap, onEdit, onDelete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Row(
          children: [
            Expanded(
              child: Text(
                Get.find<AppController>().appModel.language ==
                        ApplicationLanguage.ar
                    ? category.nameAr ?? ""
                    : category.nameEn ?? "",
                style: AppTextStyle.medium16(context),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: onEdit,
              child: Icon(
                Icons.edit,
                size: 18.sp,
              ),
            ),
            10.horizontalSpace,
            GestureDetector(
              onTap: onDelete,
              child: Icon(
                Icons.delete,
                size: 18.sp,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

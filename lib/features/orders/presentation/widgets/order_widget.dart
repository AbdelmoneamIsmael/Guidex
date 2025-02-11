import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/const/enum.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/features/orders/presentation/widgets/order_info_widget.dart';
import 'package:guidix/gen/assets.gen.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.orderStatus,
  });
  final OrderStatus orderStatus;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16).w,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Theme.of(context).textTheme.bodyMedium!.color!,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(Assets.images.productCart.path),
              ),
              8.verticalSpace,
              Center(
                child: Text(
                  "Qr Code",
                  style: AppTextStyle.simiBold16(context).copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Expanded(child: 16.verticalSpace),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context).quantity,
                    style: AppTextStyle.regular16(context),
                  ),
                  Text(
                    ":",
                    style: AppTextStyle.regular16(context),
                  ),
                  Text(
                    "3",
                    style: AppTextStyle.medium16(context),
                  ),
                ],
              ),
              8.verticalSpace,
              OrderInfoWidget(
                title: AppLocalizations.of(context).subTotal,
                value: "30 EGP",
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: orderStatus == OrderStatus.completed
              ? SvgPicture.asset(
                  Assets.icons.completed,
                )
              : SvgPicture.asset(
                  Assets.icons.canceld,
                ),
        )
      ],
    );
  }
}

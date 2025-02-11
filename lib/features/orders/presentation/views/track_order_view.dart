import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/app_texts/app_localizations.dart';
import 'package:guidix/core/const/enum.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';
import 'package:guidix/features/orders/presentation/widgets/order_info_widget.dart';
import 'package:guidix/features/orders/presentation/widgets/order_widget.dart';
import 'package:guidix/gen/assets.gen.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Center(
          child: Text(
            "QR Code",
            style: AppTextStyle.simiBold18(context).copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        16.verticalSpace,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16).w,
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
              Image.asset(
                Assets.images.productCart.path,
              ),
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  OrderInfoWidget2(
                    title: AppLocalizations.of(context).order,
                    value: "382015",
                  ),
                  OrderInfoWidget2(
                    title: AppLocalizations.of(context).quantity,
                    value: "3",
                  ),
                  OrderInfoWidget2(
                    title: AppLocalizations.of(context).subTotal,
                    value: "90 EGP ",
                  ),
                  OrderInfoWidget2(
                    title: AppLocalizations.of(context).cashOnDelivery,
                    value: "10 EGP",
                  ),
                  OrderInfoWidget2(
                    title: AppLocalizations.of(context).total,
                    value: "100 EGP ",
                  ),
                ],
              ),
            ],
          ),
        ),
        GuidexTimeLine(
          done: true,
          title: AppLocalizations.of(context).orderPlaced,
          isFirst: true,
          description: "August 10/3/2025",
          time: "10:00 AM",
          icon: Assets.icons.shoppingCartTrack,
        ),
        GuidexTimeLine(
          done: true,
          title: AppLocalizations.of(context).orderDispatched,
          description: "August 10/3/2025",
          time: "10:00 AM",
          icon: Assets.icons.store,
        ),
        GuidexTimeLine(
          done: true,
          title: AppLocalizations.of(context).orderInTransit,
          description:
              "27 Gamal Abd El Nasser street, Qism EL M ontaza, Miami, Alexandria",
          icon: Assets.icons.shoppingCartTrack,
        ),
        GuidexTimeLine(
          done: false,
          title: AppLocalizations.of(context).deliveredSuccessfully,
          description: "August 10/3/2025",
          time: "10:00 AM",
          isLast: true,
          icon: Assets.icons.thumbUp,
        ),
      ],
    );
  }
}

class GuidexTimeLine extends StatelessWidget {
  const GuidexTimeLine(
      {super.key,
      this.isFirst = false,
      this.isLast = false,
      required this.icon,
      required this.title,
      required this.description,
      this.time,
      required this.done});
  final bool isFirst;
  final bool isLast, done;
  final String icon, title, description;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.w,
      child: TimelineTile(
        alignment: TimelineAlign.start,
        lineXY: 0.3,
        isFirst: isFirst,
        isLast: isLast,
        afterLineStyle: LineStyle(
          thickness: done ? 1.w : .2.w,
          color: done
              ? Theme.of(context).primaryColor
              : Theme.of(context).textTheme.bodySmall!.color!,
        ),
        beforeLineStyle: LineStyle(
          thickness: done ? 1.w : .2.w,
          color: done
              ? Theme.of(context).primaryColor
              : Theme.of(context).textTheme.bodySmall!.color!,
        ),
        indicatorStyle: IndicatorStyle(
          width: 50.w,
          indicator: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isLast
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Theme.of(context).primaryColor,
              border: Border.all(
                color: isLast
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            width: 50.w,
            height: 50.w,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isLast ? Theme.of(context).primaryColor : Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          height: 50.w,
          padding: EdgeInsets.only(
            right: 24.w,
          ),
          color: Theme.of(context).primaryColor,
        ),
        hasIndicator: true,
        endChild: SizedBox(
          width: 230.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyle.medium18(context),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: AppTextStyle.regular16(context),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    time ?? "      ",
                    style: AppTextStyle.regular16(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: AppTextStyle.regular16(context),
            ),
          ),
          Text(
            " : ",
            style: AppTextStyle.regular16(context),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTextStyle.medium16(context),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderInfoWidget2 extends StatelessWidget {
  const OrderInfoWidget2({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.regular14(context),
        ),
        Text(
          " : ",
          style: AppTextStyle.regular14(context),
        ),
        Text(
          value,
          style: AppTextStyle.medium14(context),
        ),
      ],
    );
  }
}

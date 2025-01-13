import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guidix/core/themes/styles/app_text_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.semanticLabel,
    required this.semanticHint,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    this.obscureText = false,
  });
  final String hintText, semanticLabel, semanticHint;
  final Widget? suffixIcon, prefixIcon;
  final TextEditingController controller;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: AppTextStyle.regular16.copyWith(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        4.verticalSpace,
        Semantics(
          // label: semanticLabel,
          hint: semanticHint,
          child: TextFormField(
            obscureText: obscureText!,
            style: AppTextStyle.regular16,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: .8,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ).w,
              hintText: "Enter $hintText",
              semanticCounterText: semanticLabel,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: .8,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: .8,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

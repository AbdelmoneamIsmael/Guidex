import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.textAlign,
  });
  final TextAlign? textAlign;
  final String hintText, semanticLabel, semanticHint;
  final Widget? suffixIcon, prefixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: AppTextStyle.regular16(context),
        ),
        4.verticalSpace,
        GuidixFormField(
            semanticHint: semanticHint,
            obscureText: obscureText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            maxLines: maxLines,
            semanticLabel: semanticLabel,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters),
      ],
    );
  }
}

class GuidixFormField extends StatelessWidget {
  const GuidixFormField({
    super.key,
    required this.semanticHint,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    required this.hintText,
    required this.semanticLabel,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign,
  });

  final String semanticHint;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final String semanticLabel;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      // label: semanticLabel,
      hint: semanticHint,

      child: TextFormField(
        maxLines: maxLines,
        textAlign: textAlign ?? TextAlign.start,
        obscureText: obscureText!,
        keyboardType: TextInputType.name,
        style: AppTextStyle.regular16(context),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            borderSide: BorderSide(
              color: Theme.of(context).textTheme.bodyMedium!.color!,
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ).w,
          hintText: "Enter $hintText",
          hintStyle: AppTextStyle.regular16(context).copyWith(
            color: Theme.of(context).colorScheme.scrim,
          ),
          semanticCounterText: semanticLabel,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).textTheme.bodyMedium!.color!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).textTheme.bodyMedium!.color!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppSwitchWidget extends StatelessWidget {
  const AppSwitchWidget({
    super.key,
    required this.active,
    this.activeColor,
    this.inActiveColor,
    required this.onChanged,
    this.inActiveBorderColor,
    this.activeBorderColor,
  });

  /// is activate or not
  final bool active;
  final Color? activeColor,
      inActiveColor,
      inActiveBorderColor,
      activeBorderColor;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: const AlwaysStoppedAnimation(1),
      child: Switch(
        value: active,
        thumbColor: WidgetStateProperty.all<Color>(Colors.white),
        trackColor: WidgetStateProperty.lerp<Color>(
          WidgetStateProperty.all<Color>(activeColor ?? Colors.red),
          WidgetStateProperty.all<Color>(inActiveColor ?? Colors.grey),
          1,
          (p0, p1, p2) {
            return active ? p0 : p1;
          },
        ),
        // trackColor:
        //     WidgetStateProperty.all<Color>(AppColors.secondColor),

        inactiveTrackColor: inActiveColor ?? Colors.grey,
        // hoverColor: AppColors.secondColor,
        trackOutlineColor: WidgetStateProperty.lerp<Color>(
          WidgetStateProperty.all<Color>(
            activeBorderColor ?? Colors.red,
          ),
          WidgetStateProperty.all<Color>(
            inActiveBorderColor ?? Colors.grey,
          ),
          1,
          (p0, p1, p2) {
            return active ? p0 : p1;
          },
        ),
        onChanged: onChanged,
      ),
    );
  }
}

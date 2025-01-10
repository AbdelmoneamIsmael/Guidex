import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      label: label,
      hint: hint,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 12),
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
    required this.lable,
    required this.hint,
    this.onPressed,
    this.backgroundColor,
    this.forGroundColor,
  });
  final String title, lable, hint;
  final void Function()? onPressed;
  final Color? backgroundColor, forGroundColor;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: lable,
      hint: hint,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            foregroundColor:
                forGroundColor ?? Theme.of(context).colorScheme.onPrimary,
            shape: StadiumBorder(
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            textStyle: TextStyle(
                fontSize: MediaQuery.of(context).textScaler.scale(16)),
          ),
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}

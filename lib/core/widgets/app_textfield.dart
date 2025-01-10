import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Semantics(
            // label: semanticLabel,
            hint: semanticHint,
            child: TextFormField(
              obscureText: obscureText!,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(
                  12,
                ),
                hintText: "Enter $hintText",
                semanticCounterText: semanticLabel,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: .8),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: .8),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

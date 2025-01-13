import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuidixAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GuidixAppBar(
      {super.key, this.actions, required this.title, this.onBack});
  final List<Widget>? actions;
  final void Function()? onBack;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ).w,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Navigator.canPop(context)
                      ? Semantics(
                          label: "Back Button",
                          hint: "click to go back to previous screen",
                          button: true,
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(
                              12,
                            ).w,
                            minSize: 0,
                            onPressed: onBack ??
                                () {
                                  Navigator.pop(context);
                                },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Theme.of(context).iconTheme.color,
                              size: 24,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Text(
              title,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions ?? [],
            ))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((48 + 16 + 24).h);
}

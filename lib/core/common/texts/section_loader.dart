import 'package:flutter/material.dart';

class CustomSectionHeader extends StatelessWidget {
  const CustomSectionHeader(
      {super.key, required this.title, this.textColor, this.onPressed});

  final String title;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

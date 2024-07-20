import 'package:flutter/material.dart';
import 'package:mind/core/constants/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CColors.darkerGrey,
      content: const Text('Are you sure you want to exit quiz?'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No')),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(CColors.error.withOpacity(0.5))),
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const LabelButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
          onPressed: () {},
          child: Text(
            label,
            style: TextStyles.buttonHeading,
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nlwt/shared/themes/app_colors.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';

import '../set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnPressed;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subTitle;
  const BottomSheetWidget(
      {super.key,
      required this.primaryLabel,
      required this.secondaryLabel,
      required this.primaryOnPressed,
      required this.secondaryOnPressed,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
              color: AppColors.shape,
              child: Column(
                children: [
                  Expanded(
                      child: Container(color: Colors.black.withOpacity(0.6))),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text.rich(
                          TextSpan(
                              text: title,
                              style: TextStyles.buttonBoldHeading,
                              children: [
                                TextSpan(
                                    text: "\n$subTitle",
                                    style: TextStyles.buttonHeading)
                              ]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        color: AppColors.stroke,
                        height: 1,
                      ),
                      SetLabelButtons(
                          enablePrimaryColor: true,
                          primaryLabel: primaryLabel,
                          secondaryLabel: secondaryLabel,
                          primaryOnPressed: primaryOnPressed,
                          secondaryOnPressed: secondaryOnPressed)
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

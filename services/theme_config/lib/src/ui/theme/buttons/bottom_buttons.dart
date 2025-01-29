import 'package:flutter/material.dart';
import 'package:theme_config/src/ui/theme/buttons/custom_text_button.dart';
import 'package:theme_config/src/ui/theme/buttons/primary_button.dart';

class BottomButtons extends StatelessWidget {
  final String labelPrimary;
  final String? labelSecondary;
  final Function()? onPressPrimary, onPressSecondary;
  const BottomButtons(
      {super.key,
      required this.labelPrimary,
      this.labelSecondary,
      this.onPressPrimary,
      this.onPressSecondary});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            if (labelSecondary case final labelSecondary?)
              CustomTextButton(
                onPressed: onPressSecondary,
                label: labelSecondary,
              ),
            const SizedBox(height: 20),
            PrimaryButton(
              onPressed: onPressPrimary,
              label: labelPrimary,
            ),
          ]),
        ),
      ),
    );
  }
}

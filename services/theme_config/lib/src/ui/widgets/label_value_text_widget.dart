import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

class LabelValueTextWidget extends StatelessWidget {
  final String detail;
  final String? value;
  const LabelValueTextWidget({super.key, required this.detail, this.value});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
      text: '$detail\n',
      style: context.textTheme.bodySmall,
      children: [
        WidgetSpan(child: SizedBox(height: 28)),
        TextSpan(
          text: value,
          style: context.textTheme.bodyLarge,
        ),
      ],
    ));
  }
}

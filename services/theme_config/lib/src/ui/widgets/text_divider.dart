import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class TextDivider extends StatelessWidget {
  final String? label;
  final double height;
  const TextDivider({super.key, this.label, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return label == null
        ? Divider(
            height: height,
          )
        : SizedBox(
            height: height,
            child: Row(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                container(context),
                Text(
                  label!,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.neutral_300,
                  ),
                ),
                container(context),
              ],
            ),
          );
  }

  Widget container(BuildContext context) => Expanded(
        child: Container(
          color: context.colors.neutral_300,
          height: 1,
        ),
      );
}

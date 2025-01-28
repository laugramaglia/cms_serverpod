import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

class CustomTitleAppBar extends StatelessWidget {
  final String title;
  final Color? color;
  const CustomTitleAppBar(this.title, {this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.headlineLarge?.copyWith(
        color: color,
        fontSize: 20,
      ),
    );
  }
}

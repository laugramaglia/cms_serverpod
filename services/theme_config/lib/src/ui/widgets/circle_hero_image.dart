import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class CircleHeroImage extends StatelessWidget {
  final Widget imageWidget;
  final double radius;
  final List<Color>? gradientColors;
  const CircleHeroImage(
      {super.key,
      required this.imageWidget,
      this.radius = 50,
      this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.colors.neutral_0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors ?? context.colors.gradient)),
      padding: const EdgeInsets.all(16),
      child: SizedBox.square(
          dimension: radius,
          child: Center(
            child: imageWidget,
          )),
    );
  }
}

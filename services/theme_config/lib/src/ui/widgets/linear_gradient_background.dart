import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class LinearGradientBackground extends StatelessWidget {
  final Widget? child;
  final BorderRadiusGeometry borderRadius;
  final List<Color>? colors;
  final bool isLoading;
  final double? height;
  const LinearGradientBackground({
    super.key,
    this.child,
    this.borderRadius = BorderRadius.zero,
    this.colors,
    this.isLoading = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'background',
      child: Card(
        margin: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            width: double.infinity,
            decoration: isLoading
                ? null
                : BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0, -.9),
                      end: Alignment.bottomCenter,
                      colors: colors ?? context.colors.gradient,
                    ),
                  ),
            child: child,
          ),
        ),
      ),
    );
  }
}

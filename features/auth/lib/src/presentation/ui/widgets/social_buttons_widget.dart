import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class SocialButtonsWidget extends StatefulWidget {
  final bool googleAuthEnamble, appleAuthEnable;
  const SocialButtonsWidget({
    super.key,
    this.googleAuthEnamble = true,
    this.appleAuthEnable = true,
  });

  @override
  State<SocialButtonsWidget> createState() => _SocialButtonsWidgetState();
}

class _SocialButtonsWidgetState extends State<SocialButtonsWidget>
    with LoadingOverlayMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (widget.googleAuthEnamble)
          _IconButton(
            onPressed: () async {
              await insetOverlay(
                context,
                () async {},
              );
            },
            icon: Icons.g_mobiledata,
          ),
        if (widget.appleAuthEnable)
          _IconButton(
            onPressed: () async {
              await insetOverlay(
                context,
                () async {},
              );
            },
            icon: Icons.apple,
          ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  const _IconButton({required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      color: context.colors.neutral_0, // icon color
      splashColor: context.colors.neutral_200,
      disabledColor: context.colors.neutral_300,
      icon: Icon(icon),
    );
  }
}

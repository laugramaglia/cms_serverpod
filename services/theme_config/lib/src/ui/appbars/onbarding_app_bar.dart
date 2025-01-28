import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool implementLeading, implementClose, centerTitle;
  final Widget? leading, title;
  final List<Widget>? actions;

  const OnboardingAppBar({
    super.key,
    this.implementLeading = true,
    this.implementClose = true,
    this.centerTitle = true,
    this.leading,
    this.title,
    this.actions,
  });

  final double curveSize = 20;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OnboardingCustomClipper(curveSize: curveSize),
      child: AppBar(
        backgroundColor: context.colors.primary,
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        title: title ??
            SvgPicture.asset(
              'assets/brand/logo.svg',
              colorFilter:
                  ColorFilter.mode(context.colors.neutral_0, BlendMode.srcIn),
            ),
        leading: leading ??
            (!implementLeading
                ? null
                : BackButton(color: context.colors.neutral_0)),
        actions: actions ??
            [
              if (implementClose)
                CloseButton(
                  color: context.colors.neutral_0,
                  onPressed: () => context.pop(),
                ),
            ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10 + curveSize);
}

class OnboardingCustomClipper extends CustomClipper<Path> {
  final double curveSize;

  OnboardingCustomClipper({required this.curveSize});
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          0, size.height - curveSize, curveSize * 1.5, size.height - curveSize)
      ..lineTo(size.width - curveSize * 1.5, size.height - curveSize)
      ..quadraticBezierTo(
          size.width, size.height - curveSize, size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(OnboardingCustomClipper oldClipper) => false;
}

class SliverOnboardingAppBar extends StatelessWidget {
  final bool implementLeading, implementClose, centerTitle;
  final Widget? leading, title;
  final List<Widget>? actions;
  const SliverOnboardingAppBar({
    super.key,
    this.implementLeading = true,
    this.implementClose = true,
    this.centerTitle = true,
    this.leading,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      collapsedHeight: 80,
      title: title ??
          SvgPicture.asset(
            'assets/brand/logo.svg',
            colorFilter:
                ColorFilter.mode(context.colors.neutral_0, BlendMode.srcIn),
          ),
      leading: leading ??
          (!implementLeading
              ? null
              : BackButton(color: context.colors.neutral_0)),
      actions: actions ??
          [
            if (implementClose)
              CloseButton(
                  color: context.colors.neutral_0,
                  onPressed: () {
                    context.pop();
                  }),
          ],
      flexibleSpace: ClipPath(
        clipper: OnboardingCustomClipper(curveSize: 20),
        child: FlexibleSpaceBar(
          background: Container(
            decoration: BoxDecoration(
              color: context.colors.primary,
            ),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}

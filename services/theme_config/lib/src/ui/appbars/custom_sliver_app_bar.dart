import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String? titleTxt;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? bottomSpace, flexibleSpace;
  final double bottomSpaceHeight;
  final Color? bgColor;
  final double toolbarHeight;
  final bool pinned, implementLeading;
  const CustomSliverAppBar({
    super.key,
    this.title,
    this.actions,
    this.bottomSpace,
    this.bottomSpaceHeight = 80,
    this.flexibleSpace,
    this.titleTxt,
    this.toolbarHeight = 80,
    this.pinned = true,
    this.implementLeading = false,
    this.bgColor,
  }) : assert(titleTxt != null || title != null);

  @override
  Widget build(BuildContext context) {
    const borderRadius = Radius.circular(12);

    return SliverAppBar(
      pinned: pinned,
      title: title ??
          CustomTitleAppBar(titleTxt!, color: context.colors.neutral_0),
      automaticallyImplyLeading: false,
      leading: !implementLeading
          ? null
          : BackButton(color: context.colors.neutral_0),
      actions: actions,
      centerTitle: false,
      toolbarHeight: toolbarHeight,
      backgroundColor: bgColor ?? context.colors.primary,
      bottom: bottomSpace == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(bottomSpaceHeight),
              child: LinearGradientBackground(
                borderRadius: const BorderRadius.vertical(bottom: borderRadius),
                child: bottomSpace,
              ),
            ),
      flexibleSpace: flexibleSpace == null
          ? null
          : FlexibleSpaceBar(
              background: LinearGradientBackground(
                borderRadius: const BorderRadius.vertical(bottom: borderRadius),
                child: flexibleSpace,
              ),
            ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: borderRadius,
          bottomRight: borderRadius,
        ),
      ),
    );
  }
}

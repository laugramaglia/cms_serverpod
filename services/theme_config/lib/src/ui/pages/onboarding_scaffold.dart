import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class OnboardingScaffold extends StatelessWidget {
  final String? welcomeMessage, pageTitle, description;
  final Widget? tagWidget;
  final bool implementLeading, useAppBar, implementClose;
  final List<Widget> slivers;
  final Widget? appBarTitle;
  final List<Widget>? appBarActions;
  final double? bottomSpacing;
  const OnboardingScaffold({
    super.key,
    this.welcomeMessage,
    this.pageTitle,
    this.description,
    this.tagWidget,
    this.implementLeading = true,
    this.implementClose = true,
    required this.slivers,
    this.useAppBar = true,
    this.appBarTitle,
    this.appBarActions,
    this.bottomSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(slivers: [
        if (useAppBar)
          SliverOnboardingAppBar(
            implementLeading: implementLeading,
            implementClose: implementClose,
            title: appBarTitle,
            actions: appBarActions,
          ),
        TitleSectionWidget.sliver(
          tagWidget: tagWidget,
          welcomeMessage: welcomeMessage,
          title: pageTitle,
          description: description,
          bottomSpacing: bottomSpacing,
        ),
        ...slivers,
      ]),
    );
  }
}

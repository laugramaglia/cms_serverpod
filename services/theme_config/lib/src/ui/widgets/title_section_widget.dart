import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

enum SectionType { sliver, nonSliver }

class TitleSectionWidget extends StatelessWidget {
  final String? welcomeMessage;
  final Widget? tagWidget;
  final String? title;
  final String? description;
  final double? bottomSpacing;

  final SectionType _sectionType;

  const TitleSectionWidget(
      {super.key,
      this.welcomeMessage,
      this.tagWidget,
      this.title,
      this.description,
      this.bottomSpacing,
      SectionType type = SectionType.nonSliver})
      : _sectionType = type;

  factory TitleSectionWidget.sliver({
    String? welcomeMessage,
    String? title,
    String? description,
    Widget? tagWidget,
    double? bottomSpacing,
  }) =>
      TitleSectionWidget(
        welcomeMessage: welcomeMessage,
        title: title,
        description: description,
        tagWidget: tagWidget,
        bottomSpacing: bottomSpacing,
        type: SectionType.sliver,
      );

  List<Widget> children(BuildContext context) => [
        if (tagWidget case final tagWidget?) tagWidget,
        if (welcomeMessage case final welcomeMessage?)
          Padding(
            padding: const EdgeInsets.only(top: 42, bottom: 62),
            child: Center(
              child:
                  Text(welcomeMessage, style: context.textTheme.headlineLarge),
            ),
          ),
        if (title case final title?)
          Padding(
            padding: const EdgeInsets.only(bottom: 16)
                .copyWith(top: welcomeMessage == null ? 42 : 0),
            child: Text(
              title,
              style: welcomeMessage == null
                  ? context.textTheme.headlineLarge
                  : context.textTheme.headlineMedium,
            ),
          ),
        if (description case final description?)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(description),
          ),
      ];

  @override
  Widget build(BuildContext context) {
    return _sectionType == SectionType.sliver
        ? SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(bottom: bottomSpacing ?? 20),
            sliver: SliverList.list(children: children(context)),
          )
        : ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(bottom: bottomSpacing ?? 20),
            children: children(context));
  }
}

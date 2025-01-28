import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:theme_config/theme_config.dart';

class NavigatorScaffoldWidget extends StatefulWidget {
  final String? currentLocation;
  final List<({BottomNavigationBarItem item, GoRoute route})> items;
  final Widget child;
  const NavigatorScaffoldWidget(
      {super.key,
      required this.child,
      required this.items,
      this.currentLocation});

  @override
  State<NavigatorScaffoldWidget> createState() =>
      _NavigatorScaffoldWidgetState();
}

class _NavigatorScaffoldWidgetState extends State<NavigatorScaffoldWidget> {
  void navigationHandler(BuildContext context, int index) =>
      index >= 0 && index < widget.items.length
          ? context.go(widget.items[index].route.path)
          : null;

  @override
  Widget build(BuildContext context) {
    final index = widget.items.indexWhere(
      (i) => widget.currentLocation?.contains(i.route.path) ?? false,
    );

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: context.colors.primary,
        showUnselectedLabels: true,
        unselectedItemColor: context.colors.neutral_300,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => navigationHandler(context, i),
        items: List<BottomNavigationBarItem>.from(
            widget.items.map((item) => item.item)),
      ),
    );
  }
}

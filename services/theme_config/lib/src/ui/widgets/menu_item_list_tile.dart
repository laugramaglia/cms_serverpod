import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class MenuItemListTile extends StatelessWidget {
  final IconData? icon;
  final String label;
  final void Function()? onTap;
  final Widget? trailing;
  const MenuItemListTile(
      {super.key, this.icon, required this.label, this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon == null
          ? null
          : Icon(
              icon,
              size: 25,
            ),
      title: Text(
        label,
        style: context.textTheme.bodyLarge,
      ),
      trailing: trailing,
      onTap: onTap,
      minVerticalPadding: 20,
      horizontalTitleGap: 30,
      shape: Border(
        bottom: BorderSide(color: Colors.grey[300]!),
      ),
    );
  }
}

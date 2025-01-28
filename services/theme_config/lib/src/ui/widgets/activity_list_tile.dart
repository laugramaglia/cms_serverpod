import 'package:flutter/material.dart';
import 'package:theme_config/theme_config.dart';

class ActivityListTile extends StatelessWidget {
  final String label;
  final String? descriptionLabel;
  final String? price;
  final String? date;
  final bool obscure;
  final Widget? leading, trailing;
  final Function()? onTap;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? contentPadding;

  const ActivityListTile({
    super.key,
    required this.label,
    this.descriptionLabel,
    this.price,
    this.date,
    this.obscure = false,
    this.leading,
    this.onTap,
    this.shape,
    this.contentPadding = EdgeInsets.zero,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: contentPadding,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label.capitalizedTexts,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      subtitle: descriptionLabel == null
          ? null
          : Align(
              alignment: Alignment.centerLeft,
              child: Text(
                descriptionLabel!,
                overflow: TextOverflow.ellipsis,
              )),
      leading: leading,
      trailing: trailing ??
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (price case final price?)
                  Text(
                    obscure ? '****' : price,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: price.contains('-')
                          ? null
                          : context.colors.confirmation_700,
                    ),
                  ),
                if (date case final date?) Text(date)
              ]),

      // border bottom
      shape: shape ??
          Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
    );
  }
}

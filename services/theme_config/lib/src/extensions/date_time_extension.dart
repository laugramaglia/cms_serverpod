import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as ago;

extension DateTimeExtension on DateTime {
  String get datePlusHours =>
      '$dateString • ${DateFormat.Hm().format(toLocal())}hs';

  String get dateString => DateFormat(DateFormat.ABBR_MONTH_DAY, 'es_AR')
      .format(toLocal())
      .toUpperCase();

  String toBirthDate() =>
      DateFormat(DateFormat.YEAR_MONTH_DAY, 'es').format(this);

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays < 1) {
      return ago.format(
        this,
        locale: 'es_short',
      );
    }

    return datePlusHours;
  }
}

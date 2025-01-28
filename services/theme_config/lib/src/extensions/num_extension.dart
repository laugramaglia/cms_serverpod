import 'package:intl/intl.dart';

extension CurrencyFormatter on num {
  /// Formats the number as currency with the specified locale and symbol.
  String toCurrency({
    String locale = 'es_AR',
    String symbol = '\$',
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: '',
      decimalDigits: 2,
    );
    return '$symbol${formatter.format(this)}';
  }

  String toFormatedNum({
    String locale = 'es',
  }) {
    final formatter =
        NumberFormat.decimalPatternDigits(locale: locale, decimalDigits: 2);
    return formatter.format(this);
  }
}

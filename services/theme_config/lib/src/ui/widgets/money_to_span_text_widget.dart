import 'package:flutter/material.dart';
import 'package:theme_config/src/extensions/num_extension.dart';
import 'package:theme_config/src/extensions/theme_extension.dart';

class MoneyToSpanTextWidget extends StatelessWidget {
  final String? code;
  final double amount;
  final bool obscure;
  final Color? txtColor;
  const MoneyToSpanTextWidget(
      {super.key,
      this.code,
      required this.amount,
      this.obscure = false,
      this.txtColor});

  @override
  Widget build(BuildContext context) {
    final formattedAmount = amount.toFormatedNum().split(',');
    return FittedBox(
      child: Text.rich(
        TextSpan(
          style: context.textTheme.headlineMedium?.copyWith(
            color: txtColor ?? context.colors.neutral_0,
          ),
          children: [
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Baseline(
                  baseline: 0, // Adjust this value to align properly
                  baselineType: TextBaseline.alphabetic,
                  child: Text(
                    '$code ',
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: txtColor ?? context.colors.neutral_0,
                      fontSize: 20,
                    ),
                  ),
                )),
            TextSpan(
              text: obscure ? '****' : formattedAmount[0],
              style: context.textTheme.headlineMedium?.copyWith(
                fontSize: 50,
                color: txtColor ?? context.colors.neutral_0,
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.top,
              child: Baseline(
                baseline: -5, // Adjust this value to align properly
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  obscure
                      ? '**'
                      : formattedAmount.length < 2
                          ? '00'
                          : ' ${formattedAmount[1]}',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: txtColor ?? context.colors.neutral_0,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

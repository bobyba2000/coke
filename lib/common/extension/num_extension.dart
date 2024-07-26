import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension NumExtension on num {
  Widget get hSpace => SizedBox(
        height: toDouble(),
      );
  Widget get wSpace => SizedBox(
        width: toDouble(),
      );

  String toStringWithSeperator() {
    return NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 0,
    ).format(toInt());
  }
}

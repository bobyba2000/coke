import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension NumExtension on num {
  Widget get hSpace => SizedBox(
        height: toDouble(),
      );
  Widget get wSpace => SizedBox(
        width: toDouble(),
      );

  double get wMax {
    if (this > w) {
      return toDouble();
    } else {
      return w;
    }
  }

  double get wMin {
    if (this < w) {
      return toDouble();
    } else {
      return w;
    }
  }

  double get hMax {
    if (this > h) {
      return toDouble();
    } else {
      return h;
    }
  }

  String toStringWithSeperator() {
    return NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 0,
    ).format(toInt());
  }
}

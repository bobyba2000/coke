import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String get toUIDateString {
    if (this == null) {
      return '';
    }
    return DateFormat('MM-yyyy').format(this!);
  }
}

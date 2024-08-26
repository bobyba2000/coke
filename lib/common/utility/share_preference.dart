import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtitlity {
  static Future<DateTime?> checkIsShowLanguagePopup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? time = prefs.getString('timeLanguage');
    if (time == null) {
      return null;
    }
    return DateFormat('HH:mm dd/MM/yyyy').parse(time);
  }

  static Future<void> markShowLanguagePopup(DateTime time) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('timeLanguage', DateFormat('HH:mm dd/MM/yyyy').format(time));
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtitlity {
  static Future<bool> checkIsShowLanguagePopup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('isShowLanguage');
    return repeat ?? false;
  }

  static Future<void> markShowLanguagePopup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isShowLanguage', true);
  }
}

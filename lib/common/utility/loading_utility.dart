import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class LoadingUtility {
  static Future<void> show() {
    return SmartDialog.showLoading(
      backDismiss: false,
      clickMaskDismiss: false,
    );
  }

  static Future<void> dismiss() {
    return SmartDialog.dismiss();
  }
}

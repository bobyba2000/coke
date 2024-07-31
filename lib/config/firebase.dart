import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

class FirebaseConfig {
  static FirebaseApp? app;
  static String? userRole;

  static Future<void> init() async {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // database = FirebaseDatabase.instance;
    // auth = FirebaseAuth.instanceFor(app: app!);
    // storage = FirebaseStorage.instance;
  }
}

import 'dart:convert';

import 'package:coke_platform/constants/firebase_path.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseContestantService {
  String? generateKey() {
    return FirebaseDatabase.instance
        .ref(
          FirebasePath.contestant,
        )
        .push()
        .key;
  }

  Future<void> update(ContestantModel model) {
    return FirebaseDatabase.instance
        .ref('${FirebasePath.contestant}/${model.key}')
        .set(
          jsonDecode(jsonEncode(model.toJson())),
        );
  }
}

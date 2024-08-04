import 'package:coke_platform/constants/firebase_path.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRoleService {
  Future<String?> getUserRole(String uId) async {
    final snapshot = await FirebaseDatabase.instance.ref('${FirebasePath.role}/$uId').get();
    return snapshot.value?.toString();
  }
}

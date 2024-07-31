import 'package:coke_platform/common/widget/field/file_dropzone.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> upload(String path, FileModel file) async {
    final storage = _storage.ref().child(path);
    await storage.putData(file.bytes);
    final url = await storage.getDownloadURL();
    return url;
  }
}

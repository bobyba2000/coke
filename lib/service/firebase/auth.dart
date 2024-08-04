import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isUserSignedIn() {
    return _auth.currentUser != null;
  }

  String? getUserId() {
    return _auth.currentUser?.uid;
  }

  String? getUserEmail() {
    return _auth.currentUser?.email;
  }

  String? getAvatarUrl() {
    return _auth.currentUser?.photoURL;
  }

  String? getUserName() {
    return _auth.currentUser?.displayName;
  }

  Future<void> resetPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> changePassword(String newPassword) {
    return _auth.currentUser!.updatePassword(newPassword);
  }

  Future<void> logout() async {
    return _auth.signOut();
  }
}

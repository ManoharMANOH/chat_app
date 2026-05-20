import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static FirebaseAuth get _auth => FirebaseAuth.instance;

  static bool get isLoggedIn => _auth.currentUser != null;

  static String? get uid => _auth.currentUser?.uid;

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(email.split("@").first);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "SignUp failed";
    }
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login failed";
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Logout failed";
    }
  }
}

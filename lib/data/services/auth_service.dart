import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static FirebaseAuth get _auth => FirebaseAuth.instance;

  static FirebaseFirestore get _fireStore => FirebaseFirestore.instance;

  static bool get isLoggedIn => _auth.currentUser != null;

  static String? get uid => _auth.currentUser?.uid;

  /// Users Collection
  static CollectionReference<UserModel> get collectionRef {
    return _fireStore
        .collection("users")
        .withConverter<UserModel>(
          toFirestore: (user, _) => user.toMap(),
          fromFirestore: (snapshot, _) => UserModel.fromMap(snapshot.data()!),
        );
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user != null) {
        final userModel = UserModel(
          id: user.uid,
          email: email,
          name: email.split("@").first,
          isOnline: true,
          updatedAt: DateTime.now(),
          createdAt: DateTime.now(),
        );
        await collectionRef.doc(user.uid).set(userModel);
      }
      return user;
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
      final user = credential.user;
      if (user != null) {
        await collectionRef.doc(user.uid).update({
          "isOnline": true,
          "updatedAt": DateTime.now().millisecondsSinceEpoch,
        });
      }
      return user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Login failed";
    }
  }

  Future<void> signOut() async {
    try {
      final userId = uid;

      if (userId != null) {
        await collectionRef.doc(userId).update({
          "isOnline": false,
          "updatedAt": DateTime.now().millisecondsSinceEpoch,
        });
      }
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "Logout failed";
    }
  }
}

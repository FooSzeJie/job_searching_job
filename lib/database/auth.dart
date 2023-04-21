import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  // Get the firebase data
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get the now account
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Sign In Function
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  // Register Function
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  // Sign Out function
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Get the current account email
  String? getCurrentUserEmail() {
    return currentUser?.email;
  }
}
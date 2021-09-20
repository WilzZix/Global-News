import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth firebaseAuth;

  UserRepository({FirebaseAuth firebaseAuth})
      : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return Future.wait([firebaseAuth.signOut()]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<User> getUser() async {
    return firebaseAuth.currentUser;
  }
}

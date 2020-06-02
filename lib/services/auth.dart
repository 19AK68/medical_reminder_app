import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_reminder/models/user.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future loginWithEmail(String email, String password) async {
    try {
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      print("firebaseUser" + firebaseUser.toString());
      print("_userFromFirebaseUser" +
          _userFromFirebaseUser(firebaseUser).toString());
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print("signInEmailAndPassword error: " + e.toString());
      return null;
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {
      AuthResult authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print("signUPEmailAndPassword error: " + e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return _firebaseAuth.signOut();
    } catch (e) {
      print("signOut error: " + e.toString());
      return null;
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged =>_firebaseAuth.onAuthStateChanged.map(
          (FirebaseUser user) => user?.uid,
  );

  // email and password Sign in

  Future<String>signInWithEmailAndPassword(String email, String passaword) async {
    try{
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: passaword);
      final currentUser = authResult.user;
      return currentUser.uid;
    }catch (e) {
      print("signIPEmailAndPassword error: " + e.toString());
      return null;
    }
  }

  // email and password Sign UP

  Future<String> createUserWithEmailAndPassword(String email,String password, String name) async {
    try {
      AuthResult authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password,);

      final currentUser = authResult.user;
      //update username
      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      await currentUser.updateProfile(userUpdateInfo);
      await currentUser.reload();
      return currentUser.uid;
    } catch (e) {
      print("signUPEmailAndPassword error: " + e.toString());
      return null;
    }

  }

  // Sign out

  signOut(){
   return _firebaseAuth.signOut();
  }

}
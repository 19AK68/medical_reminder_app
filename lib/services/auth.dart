import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_reminder/models/users.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  //UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

   _userFromFirebaseUser(User firebaseUser) {
     if(firebaseUser == null){
       return null;
     } else {
      return Users(uid: firebaseUser.uid.toString());
     }
     
   // return user != null ? User(uid: user.uid) : null;
  }

  Future loginWithEmail(String email, String password) async {

    try{

      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email,password: password);

      return _userFromFirebaseUser(userCredential.user);

    }  on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    }

    // try {
    //   AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
    //       email: email, password: password);
    //   FirebaseUser firebaseUser = authResult.user;
    //   print("firebaseUser" + firebaseUser.toString());
    //   print("_userFromFirebaseUser" +
    //       _userFromFirebaseUser(firebaseUser).toString());
    //   return _userFromFirebaseUser(firebaseUser);
    // } catch (e) {
    //   print("signInEmailAndPassword error: " + e.toString());
    //   return null;
    // }
  }

  Future signUpWithEmail(String email, String password) async {
    try{

      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email,password: password);

      return _userFromFirebaseUser(userCredential.user);

    }  on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    }
    // try {
    //   AuthResult authResult = await _firebaseAuth
    //       .createUserWithEmailAndPassword(email: email, password: password);
    //   FirebaseUser firebaseUser = authResult.user;
    //   return _userFromFirebaseUser(firebaseUser);
    // } catch (e) {
    //   print("signUPEmailAndPassword error: " + e.toString());
    //   return null;
    // }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print("signOut error: " + e.toString());
      return null;
    }
  }
}

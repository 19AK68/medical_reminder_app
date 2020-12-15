import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_reminder/util/ui_helper.dart';

class FirebaseMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final Firestore firestore = Firestore.instance;

  //user class
  //Users user = Users();

  Future<FirebaseUser> getCurrentUser() async {
    //FirebaseUser currentUser;
    // currentUser = await _firebaseAuth.currentUser();
  //  return await _firebaseAuth.currentUser();
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    QuerySnapshot result = await firestore
        .collection('users')
        .where('email', isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;
    return docs.length == 0 ? true : false;
  }

  // Future<void> addDataToDb(FirebaseUser currenfUser) {
  //   String username = UI.getUsername(currenfUser.email);
  //   user = User(
  //     uid: currenfUser.uid,
  //     email: currenfUser.email,
  //     name: username,
  //   );
  // }
}

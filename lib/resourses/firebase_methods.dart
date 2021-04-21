
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_reminder/util/ui_helper.dart';

class FirebaseMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;

  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //user class
  //Users user = Users();


  Future<bool> authenticateUser() async {
    QuerySnapshot result = await firestore
        .collection('users')
        .where('email', isEqualTo: user.email)
        .get();

    final List<DocumentSnapshot> docs = result.docs;
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

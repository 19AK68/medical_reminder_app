import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_reminder/models/medical_model.dart';
import 'package:medical_reminder/models/users.dart';
import 'package:medical_reminder/page/model/user.dart';
import 'package:medical_reminder/services/auth.dart';

class DataBaseServices {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  AuthService _authService = AuthService();



  ///Get
  Stream<List<Medical>> getMedical() {
    return _db.collection('medical').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Medical.fromJson(doc.data())).toList());
  }




  /// Upsert
 Future<void>setMedical(Medical medical){
      var options = SetOptions(merge: true);
      return _db
          .collection('medical')
          .doc(medical.medId)
          .set(medical.toMap(), options);
 }
 ///delete
 Future<void>removeMedical(String medId){
    return _db
        .collection('medical')
        .doc(medId)
        .delete();

 }

 //create collection users
  userCollection(){
    var _firebaseUser = _authService.auth.currentUser;
    _db.collection('user').doc(_firebaseUser.uid).set(
     {
       'name':_firebaseUser.displayName,
       'e-mail' :_firebaseUser.email,
     },SetOptions(merge: true)).then((_){
      print("success!");
    });


  // _db.collection('users').doc(User().uid);
}





}


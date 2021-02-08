import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_reminder/models/medical_model.dart';
import 'package:medical_reminder/models/profile_details.dart';
import 'package:medical_reminder/models/profile_details.dart';

import 'package:medical_reminder/services/auth.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/widget/toast_widget.dart';

class DataBaseServices {
  FirebaseFirestore dataBaseInstance = FirebaseFirestore.instance;
  AuthService authService = AuthService();
  AsyncSnapshot<DocumentSnapshot> snapshot;

  userData() {
    var _firebaseUser = authService.auth.currentUser;
    var userData = dataBaseInstance
        .collection("user")
        .doc(_firebaseUser.uid.toString())
        .get();
    return userData;
  }

  ///Get
  Stream<List<Medical>> getMedical() {
    return dataBaseInstance.collection('medical').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Medical.fromJson(doc.data())).toList());
  }

  // Stream<List<ProfileDetails>> getProfile() {
  //   var list = dataBaseInstance.collection('user').snapshots().map((snapshot) =>
  //       snapshot.docs.map((rr) => ProfileDetails.fromJson(rr.data())).toList());
  //
  //   print ('KLKLKLKLRLRLRRLRLRLR   ${list.toString()}');
  //   return list;
  // }

  void getPD() {
    dataBaseInstance.collection("user").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print('ghfjghdjkghjkdfhgdjkghfdjkghdjkghdjkgkjd');
        print(result.data());
      });
    });

    var _firebaseUser = authService.auth.currentUser;
    dataBaseInstance
        .collection("user")
        .doc(_firebaseUser.uid.toString())
        .get()
        .then((value) {
      print('ghfjghdjkghjkdfhgdjkghfdjkghdjkghdjkgkjd 2222222222222');
      print(value.data());
      print('ghfjghdjkghjkdfhgdjkghfdjkghdjkghdjkgkjd 2222222222222 NAME');
      var dataMap = value.data() as ProfileDetails;
      print(dataMap);
      print(dataMap.name);
      print(dataMap.email);
    });
  }

  /// Upsert
  Future<void> setMedical(Medical medical) {
    var options = SetOptions(merge: true);
    return dataBaseInstance
        .collection('medical')
        .doc(medical.medId)
        .set(medical.toMap(), options);
  }

  ///delete
  Future<void> removeMedical(String medId) {
    return dataBaseInstance.collection('medical').doc(medId).delete();
  }

  //create collection users
  Future<void> userCollection() async {
    var _firebaseUser = authService.auth.currentUser;
    dataBaseInstance.collection('user').doc(_firebaseUser.uid).set({
      'name': _firebaseUser.displayName,
      'e-mail': _firebaseUser.email,
    }).then((_) {
      print("success!");
    });

    // _db.collection('users').doc(User().uid);
  }

   updateDisplayName(String newName) {
     var options = SetOptions(merge: true);
    var _firebaseUser = authService.auth.currentUser;
    dataBaseInstance
        .collection('user')
        .doc(_firebaseUser.uid.toString())
        .set({'name': newName},options).then((value) {

      print("success!");

    });

  }

  getDataProfile() {
    var _firebaseUser = authService.auth.currentUser;

    dataBaseInstance
        .collection('user')
        .doc(_firebaseUser.uid.toString())
        .get()
        .then((value) {
      print("VALUE DATA ${value.data()}");
      var dddd = value.data();
      print("VALUE DATA 33 ${dddd['e-mail']}");
      return dddd["name"];
    });
  }

  Future<void> logOutApp() {
    return authService.signOut();
  }
}

class GetUserData extends StatelessWidget {
  final Color primaryColor = Color(0xFF20536c);
  final AuthService authService = AuthService();
  final String param;

  GetUserData({this.param});

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('user');

    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(authService.auth.currentUser.uid.toString()).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          UI.showMessage(context, "Something went wrong");
          return null;
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          print('DAAAAAAAAAATA: ${data}');

          return Text(
            " ${(data[param] == null) ? 'Unknown' : data[param]} ",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: primaryColor),
          );
        }

        return Text("loading");
      },
    );
  }
}

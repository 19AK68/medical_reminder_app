import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_reminder/resourses/firebase_methods.dart';

class FirebaseRepository {
  FirebaseMethods firebaseMethods = FirebaseMethods();
  Future<FirebaseUser> getCurrentUser() => firebaseMethods.getCurrentUser();
  Future<bool> authenticateUser(FirebaseUser user) =>
      firebaseMethods.authenticateUser(user);
  Future<void> addDataToDb(FirebaseUser user) =>
      firebaseMethods.addDataToDb(user);
}

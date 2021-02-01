
import 'package:medical_reminder/services/auth.dart';
import 'package:medical_reminder/services/database_services.dart';
import 'package:medical_reminder/view_model/base_model.dart';

class DrawerModel extends BaseModel {
  DrawerModel();

  AuthService authService = new AuthService();
  DataBaseServices dbServices = new DataBaseServices();


  Future<void> signOut(){
    return authService.auth.signOut();
  }

}
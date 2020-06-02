import 'package:flutter/material.dart';
import 'package:medical_reminder/util/validation/validation_item.dart';

class RegistrValidation with ChangeNotifier {
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  // getter

  ValidationItem get name => _name;
  ValidationItem get email => _email;
  ValidationItem get password => _password;

  //Setter

  void changeName(String value) {
    print("Name  : $value");
    if (!(value.length > 2) && value.isNotEmpty && value != null) {
      _name = ValidationItem(value, null);
    } else {
      _name =
          ValidationItem(null, "Name should contains more then 2 character");
    }
    notifyListeners();
    print("Name 2  : $value");
  }

  void changePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      _name = ValidationItem(value, null);
    } else {
      _name = ValidationItem(
          null, "Password should contains more then 6 character");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      _name = ValidationItem(value, null);
    } else {
      _name =
          ValidationItem(null, "Email should contains more then 6 character");
    }
    notifyListeners();
  }
}

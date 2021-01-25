import 'package:medical_reminder/services/auth.dart';
import 'package:medical_reminder/services/database_services.dart';
import 'package:medical_reminder/util/enums/auth_type.dart';
import 'package:medical_reminder/util/enums/login_input_field.dart';
import 'package:medical_reminder/util/validation/validation_item.dart';
import 'package:medical_reminder/view_model/base_model.dart';

class LoginModel extends BaseModel {
  LoginModel();

  AuthService authService = new AuthService();
  DataBaseServices dbServices = new  DataBaseServices();


  bool isCorrect = false;

  Future<void> login(AuthType authType, String email, String password) async {
    setBusy(true);
    if (authType == AuthType.Login) {
      var result = await authService.loginWithEmail(email, password);
      if (result != null) {
        isCorrect = true;
        notifyListeners();

      }
    }

    if (authType == AuthType.Register) {
      await authService.signUpWithEmail(email, password).then((value) {
        if (value != null) {
          isCorrect = true;
          notifyListeners();
        } else {
          isCorrect = false;
          notifyListeners();
        }
      });
    }
  }

  String titleText(AuthType authType) {
    String resultTitle;
    if (authType == AuthType.Login) {
      resultTitle = "Login";
    } else if (authType == AuthType.Register) {
      resultTitle = "Register";
    }

    return resultTitle;
  }

  String valitedateInput(String value, LoginInputField inputField) {
    switch (inputField) {
      case LoginInputField.NAME:
        {
          if (!(value.length > 2) && value.isNotEmpty) {
            notifyListeners();
            return "Name should contains more then 2 character";
          }
          notifyListeners();
          break;
        }

      default:
        notifyListeners();
    }

    return null;
  }


  //USER COLLECTION
  void connectUserCollection(){
    dbServices.userCollection();
  }

  //VALIDATION
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  // getter

  ValidationItem get name => _name;

  ValidationItem get email => _email;

  ValidationItem get password => _password;

  //Setter

  void changeName(String value) {
    if ((value.length >= 2) && !value.isNotEmpty) {
      _name = ValidationItem(value, null);
    } else {
      _name =
          ValidationItem(null, "Name should contains more then 3 character");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if ((value.length > 5) && value.isNotEmpty) {
      _name = ValidationItem(value, null);
    } else {
      _name = ValidationItem(
          null, "Password should contains more then 6 character");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    if ((value.length > 5) && value.isNotEmpty) {
      _name = ValidationItem(value, null);
    } else {
      _name =
          ValidationItem(null, "Email should contains more then 6 character");
    }
    notifyListeners();
  }
}

import 'package:medical_reminder/services/auth.dart';
import 'package:medical_reminder/util/enums/auth_type.dart';
import 'package:medical_reminder/util/enums/login_input_field.dart';
import 'package:medical_reminder/util/validation/validation_item.dart';
import 'package:medical_reminder/view_model/base_model.dart';

class LoginModel extends BaseModel {
  LoginModel();

  AuthService authService = new AuthService();

  bool isCorrect = false;

  Future<void> login(AuthType authType, String email, String password) async {
    setBusy(true);
    print("isLoading 1 " + isCorrect.toString());

    if (authType == AuthType.Login) {
      var result = await authService.loginWithEmail(email, password);
      setBusy(false);
      print("isLoading 2 " + isCorrect.toString());

      if (result != null) {
        print(" Login  OK");
        isCorrect = true;
        notifyListeners();
      }
    }
    print("isLoading 3 " + isCorrect.toString());

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

    print("isLoading 4  " + isCorrect.toString());
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

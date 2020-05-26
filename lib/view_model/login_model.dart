
import 'package:medical_reminder/services/auth.dart';
import 'package:medical_reminder/util/enums/auth_type.dart';
import 'package:medical_reminder/view_model/base_model.dart';

class LoginModel extends BaseModel {

  LoginModel();

  AuthService authService = new AuthService();

  bool isLoading = false;

  login(AuthType authType, String email, String password) async {
    setBusy(true);
    print("isLoading 1 " + isLoading.toString());

    if (authType == AuthType.Login) {
      var result = await authService.loginWithEmail(email, password);
      setBusy(false);
      print("isLoading 2 " + isLoading.toString());
      print("Resukt" + result.toString());
      if (result != null) {
        print(" Login  OK");
        isLoading = true;
      }
    }
    print("isLoading 3 " + isLoading.toString());

    if (authType == AuthType.Register) {
      await authService.signUpWithEmail(email, password).then((value) {
        if (value != null) {
          print(" RRRRRRRR  OK");

          isLoading = true;
        } else {
          isLoading = false;
          print("RRRRRRRRR NOT OK");
        }
      });
    }

    print("isLoading 4  " + isLoading.toString());
  }

  register(String email, String password) async {
    var result = await authService.signUpWithEmail(email, password);
    print("Create User " + result.toString());

    if (result != null) {
      isLoading = true;

      notifyListeners();
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
}


import 'package:flutter/material.dart';
import 'package:medical_reminder/services/auth_servise.dart';
import 'package:provider/provider.dart';


class AuthProvider extends InheritedWidget {
  final AuthService auth;

  AuthProvider({Key key, Widget child, this.auth}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AuthProvider of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider);
}
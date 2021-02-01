import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as FlutterToast;
import 'package:medical_reminder/util/ui_helper.dart';


class ToastWidget {
  static Future<bool> show(
      String message,
      ) {
    return FlutterToast.Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.blueGrey,
      fontSize: 16.0 * UI.textScaleFactor,
      gravity: FlutterToast.ToastGravity.BOTTOM,
      textColor: Colors.white,
      timeInSecForIosWeb: 2,
      toastLength: FlutterToast.Toast.LENGTH_LONG,
    );
  }
}
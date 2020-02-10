import 'package:flutter/material.dart';

class LoginButton extends  StatelessWidget{
  final String text;
  final Color splashColor;
  final Color highlightColor;
  final Color fillColor;
  final Color textColor;
  final Function () onPressed;

  LoginButton({this.text, this.splashColor, this.highlightColor, this.fillColor,
      this.textColor, @required this.onPressed,});


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: onPressed,
    );
  }

}


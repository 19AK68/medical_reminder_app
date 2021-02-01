import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';




class CustomAppBar {
  var  primaryColor = Color(0xFF20536c);
  static Widget build({
    @required BuildContext context,
    String title,
   Icon iconPath,
    Function onTap,
  })

  {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        customBorder: CircleBorder(),
        onTap: onTap ?? () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
            iconPath ?? Icon(Icons.arrow_back,color: Color(0xFF20536c) ),

        ),
      ),
      title: Text(
        title ?? '',
        overflow: TextOverflow.fade,
        textScaleFactor: UI.textScaleFactor,
        style: TextStyle(
          color: Color(0xFF20536c),
          fontSize: 23,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medical_reminder/widget/custom_appbar_widget.dart';

class ProfileIntoPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF20536c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        title: Center(
          child: Text('Profile Into Page',
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: primaryColor)),
        ),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
            child: Text(
          'Profile Into Page',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
        )),
      ),
    );
  }
}

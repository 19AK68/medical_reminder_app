import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final Color primaryColor = Color(0xFF20536c);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        title: Center(
          child: Text('Setting Page',
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: primaryColor)),
        ),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: Text(
            'Setting Page',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: primaryColor),
          )),
    );
  }
}

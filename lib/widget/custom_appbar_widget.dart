import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final primaryColor = const Color(0xFF20536c);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 22),
          children: <TextSpan>[
            TextSpan(
                text: 'Medication',
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: primaryColor)),
            TextSpan(
                text: 'Reminder',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: primaryColor)),
          ],
        ),
      ),
    );
  }
}

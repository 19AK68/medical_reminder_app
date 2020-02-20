import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';

class IntervalSelectionDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: UI.marginStandardHalf),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Remind me every  ",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF20536c),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
import 'package:provider/provider.dart';

class IntervalSelectionDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewEntryModel>(context);
    return Padding(
      padding: EdgeInsets.only(top: 4),//UI.marginStandardHalf/2),
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
            DropdownButton<int>(
              iconEnabledColor: Color(0xFF20536c),
              hint: model.selectedInterval == 0
                  ? Text(
                      "Select an Interval",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )
                  : null,
              elevation: 4,
              value:
                  model.selectedInterval == 0 ? null : model.selectedInterval,
              items: model.intervalItem.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newVal) {
                model.changeInterval(newVal);
                // model.selectedInterval = newVal;
                // print(" newVal " + newVal.toString());
                // model.timeInterval = model.selectedInterval.toString(); 
              
              },
            ),
            Text(
              model.selectedInterval == 1 ? " hour" : " hours",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
import 'package:provider/provider.dart';

class SelectTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewEntryModel>(context);
    return Container(
        child: FlatButton(
      onPressed: () {
        model.selectTime(context);
      },
      color: Color(0xFF20536c),
      shape: StadiumBorder(),
      child: Text(
        "Pick Time",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ));
  }


}

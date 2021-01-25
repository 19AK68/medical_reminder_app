import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/new_entry_model.dart';
import 'package:provider/provider.dart';

class SelectTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewEntryModel>(context);
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: UI.marginStandard,
        ),
        child: FlatButton(
          onPressed: () {
             model.selectTime(context);
          },
          minWidth: 32,
          height: 32,


         color: Color(0xFF20536c),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color:  Color(0xFF20536c))),
         // shape: StadiumBorder(),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: UI.marginStandardHalf/2,
              horizontal: UI.marginStandardHalf/2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(

                    child: Icon(Icons.calendar_today,color:Colors.white,)),
//                Container(
//                  padding: EdgeInsets.symmetric(horizontal: UI.marginStandardHalf,),
//                  child: Text(
//                    "Pick Time",
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 14,
//                      fontWeight: FontWeight.w500,
//                    ),
//                  ),
//                ),
              ],

//              decoration: BoxDecoration(color:Colors.white, borderRadius: BorderRadius.circular(20) ),
//              child: Icon(Icons.access_time),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class NewEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomPadding: false,
       backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         iconTheme: IconThemeData(
           color: Color(0xFF3EB16F),
         ),
         centerTitle: true,
         title: Text(
           'Add New Medical Reminder',
           style: TextStyle( color: Colors.black,
             fontSize: 18,),
         ),
         elevation: 0.0,

       ),
       body: Container(
         color: Colors.grey,
       ),
     );

  }

}
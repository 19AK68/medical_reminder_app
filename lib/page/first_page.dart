import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/widget/field_input_widget.dart';
import 'package:medical_reminder/widget/logo_widget.dart';

import 'home_page.dart';

class FirstPage extends StatelessWidget {
  final primaryColor = const Color(0xFF20536c);
  final colorWhite =Colors.white;

  @override
  Widget build(BuildContext context) {

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    TextEditingController emailController;
    TextEditingController passwordController;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fon.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                   colorWhite.withOpacity(0.3), BlendMode.dstATop))),
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical:UI.marginStandard, horizontal:  UI.marginStandardDouble),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget> [
                SizedBox(height: _height*0.1,),
                LogoWidget(),
                SizedBox(height: _height*0.05,),
                  RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: UI.marginStandard*3/4)
                         ,

                        child: Text(
                          "Login",
                          style: TextStyle(

                              color: colorWhite, fontSize: 25 * UI.scaleFactorH),
                        )),
                    highlightElevation: 0.0,
                    splashColor: colorWhite,
                    highlightColor: primaryColor,
                    elevation: 0.0,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: primaryColor, style: BorderStyle.solid, width: 2),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );

                    },
                  ),
                SizedBox(height: _height * 0.05),
                FlatButton(
                  child: Text(
                    "Register",
                    style: TextStyle(

                        color: primaryColor,
                        fontSize: 25 *UI.scaleFactorH),
                  ),
                  onPressed: () {

                  },
                ),

//                 Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: UI.marginStandardDouble,),
//
//                   child: RaisedButton(
//                       child: Container(
//                           padding:
//                           EdgeInsets.symmetric(vertical: UI.marginStandard),
//                           child: Text(
//                             "Register",
//                             style: TextStyle(
//                                 color: primaryColor,
//                                 fontSize: 20 * UI.scaleFactorH),
//                           )),
//                       highlightElevation: 0.0,
//                       splashColor: primaryColor,
//                       highlightColor: colorWhite,
//                       elevation: 0.0,
//                       color: colorWhite,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                             color: primaryColor,
//                             style: BorderStyle.solid,
//                             width: 1),
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       onPressed: () {
//
//                       }
// //                    => showPress(context, _emailController,
// //                    _passwordController), //loginSheet(context),
//                   ),
//                 ),
//



              ],
            ),
          ),
        ),

      ),


    );

  }
}
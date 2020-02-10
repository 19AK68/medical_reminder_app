import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_reminder/page/home_page.dart';
import 'package:medical_reminder/util/clipper.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/login_model.dart';
import 'package:medical_reminder/widget/field_input_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey _scaffoldKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(top: UI.marginStandardDouble),
              child: Center(
//
                child: Text(
                  "Mediminder",
                  style: TextStyle(
                      fontFamily: 'Arizonia',
                      fontSize: 50 * UI.scaleFactorH,
                      color: Color(0xFF20536c)),
                ),
              ),
            ),
            logo(context),
            //Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: UI.marginStandardDouble,vertical: UI.marginStandard),
              child: RaisedButton(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: UI.marginStandard),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    )),
                highlightElevation: 0.0,
                splashColor: Colors.white,
                highlightColor: Color(0xFF20536c),
                elevation: 0.0,
                color: Color(0xFF20536c),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.white, style: BorderStyle.solid, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
              ),
            ),

            /// register
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: UI.marginStandardDouble, vertical: UI.marginStandardDouble),
              child: RaisedButton(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: UI.marginStandard),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Color(0xFF20536c),fontSize: 16),
                    )),
                highlightElevation: 0.0,
                splashColor: Color(0xFF20536c),
                highlightColor: Colors.white,
                elevation: 0.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color(0xFF20536c),
                      style: BorderStyle.solid,
                      width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () => showPress(context, _emailController,
                    _passwordController), //loginSheet(context),
              ),
            ),
            Expanded(
              child: Align(
                child: ClipPath(
                  child: Container(
                    color: Color(0xFF20536c),
                    height: 300,
                  ),
                  clipper: BottomWaveClipper(),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
            // ],
            //  ),
            Container()
          ],
        ),
      ),
    );
  }



  Widget logo([BuildContext context]) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
                  child: Align(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF20536c)),
                      width: 150,
                      height: 150,
                    ),
                  ),
                  height: 154,
                )),
            Positioned(
              child: Container(
                  height: 154,
                  child: Align(
                    child: Text(
                      "GO",
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.046,
              right: MediaQuery.of(context).size.width * 0.22,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color:Color(0xFF20536c)),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.width * 0.08,
              bottom: 0,
              right: MediaQuery.of(context).size.width * 0.32,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,color: Color(0xFF20536c)),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

void showPress(
  BuildContext context,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          /*decoration: BoxDecoration(
            color: Colors.white,
          )*/
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
//                                  _emailController.clear();
//                                  _passwordController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Color(0xFF20536c),
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Align(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          padding: EdgeInsets.only(bottom: 20, top: 60),
                          child: InputField(
                            icon: Icon(Icons.email),
                            hint: "Email",
                            controller: emailController,
                            obsecure: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: InputField(
                              icon: Icon(Icons.lock),
                              hint: "Password",
                              controller: passwordController,
                              obsecure: true),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            child: RaisedButton(
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: UI.marginStandard),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              highlightElevation: 0.0,
                              splashColor: Colors.white,
                              highlightColor: Color(0xFF20536c),
                              elevation: 0.0,
                              color: Color(0xFF20536c),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 1),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              ),
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
}

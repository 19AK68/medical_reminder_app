import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_reminder/page/home_page.dart';
import 'package:medical_reminder/page/register_page.dart';
import 'package:medical_reminder/util/clipper.dart';
import 'package:medical_reminder/util/enums/auth_type.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/login_model.dart';
import 'package:medical_reminder/widget/field_input_widget.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fon.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.3), BlendMode.dstATop))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: UI.marginStandardDouble),
              child: Center(
//
//                child: Text(
//                   "",//"Medication reminder",
//                  style: TextStyle(
//                      fontFamily: 'Faustina',
//                      fontSize: 36 * UI.scaleFactorH,
//                      color: Color(0xFF20536c)),
//                ),
                  ),
            ),
            logo(context),
            //Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: UI.marginStandardDouble,
                  vertical: UI.marginStandard),
              child: RaisedButton(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: UI.marginStandard),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20 * UI.scaleFactorH),
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
                onPressed: () {
                  Navigator.of(context)
                      .push(_createRegisterRoute(AuthType.Login));

//                  if(model.isLoading){
//                    return Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => HomePage(),
//                      ),
//                    );
//                  }
//                  print("Login Error!");
//                  return null;
                },
              ),
            ),

            /// register
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: UI.marginStandardDouble,
                  vertical: UI.marginStandardDouble),
              child: RaisedButton(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: UI.marginStandard),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Color(0xFF20536c),
                            fontSize: 20 * UI.scaleFactorH),
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
                  onPressed: () {
                    Navigator.of(context)
                        .push(_createRegisterRoute(AuthType.Register));
                  }
//                    => showPress(context, _emailController,
//                    _passwordController), //loginSheet(context),
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
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
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
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/tabl5.png'),
                        fit: BoxFit.cover,
                      )), //color: Color(0xFF20536c)
                  width: 150,
                  height: 150,
                ),
              ),
              height: 150,
            )),
            Positioned(
              child: Container(
                  height: 150,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Medication",
                          style: TextStyle(
                              fontFamily: 'Arizonia',
                              fontSize: 30 * UI.scaleFactorH,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withOpacity(1)),
                        ),
                        Text(
                          "remainder",
                          style: TextStyle(
                              fontFamily: 'Arizonia',
                              fontSize: 30 * UI.scaleFactorH,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withOpacity(1)),
                        ),
                      ],
                    ),

//                    child: Text(
//                      "GO",
//                      style: TextStyle(
//                        fontSize: 80,
//                        fontWeight: FontWeight.w700,
//                        color: Colors.white.withOpacity(1),
//                      ),
//                    ),
                  )),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.046,
              right: MediaQuery.of(context).size.width * 0.22,
              child: RotatedBox(
                quarterTurns: 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/tabl5.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.width * 0.08,
              bottom: 0,
              right: MediaQuery.of(context).size.width * 0.32,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/tabl5.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRegisterRoute(AuthType _authType) {
  AuthType authType = _authType;

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        InputOrRegisterPage(authType: authType),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
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
                          child: RaisedButton(
                            child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
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
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
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

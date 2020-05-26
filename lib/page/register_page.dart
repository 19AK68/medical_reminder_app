import 'package:flutter/material.dart';
import 'package:medical_reminder/page/home_page.dart';
import 'package:medical_reminder/util/enums/auth_type.dart';
import 'package:medical_reminder/util/ui_helper.dart';
import 'package:medical_reminder/view_model/login_model.dart';
import 'package:medical_reminder/widget/field_input_widget.dart';
import 'package:provider/provider.dart';

class InputOrRegisterPage extends StatelessWidget {
  final AuthType authType;
  static TextEditingController _emailController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
  static TextEditingController _nameController = TextEditingController();

  InputOrRegisterPage({this.authType});

  Widget build(BuildContext context) {
    final model = Provider.of<LoginModel>(context);

    return Scaffold(
        // resizeToAvoidBottomPadding: true,
        //resizeToAvoidBottomInset: true,
        body:
            // color: Colors.blue,

            Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fon.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.3), BlendMode.dstATop))),
      // color:Color(0xFF20536c),
      padding: EdgeInsets.only(top: 120),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        child: Container(
          //   color: Colors.blue,
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
                          _emailController.clear();
                          _passwordController.clear();
                        },
                        icon: Icon(
                          Icons.close,
                          size: 30.0,
                          //color: Color(0xFF20536c),
                          color: Color(0xFF20536c),
                        ),
                      ),
                    )
                  ],
                ),
                height: 50,
                width: 50,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      //    color:Colors.red,
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Align(
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .white), //Theme.of(context)         .primaryColor),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          Positioned(
                            child: Container(
                              child: Text(
                                model.titleText(authType),
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF20536c), //Colors.white,
                                ),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    authType == AuthType.Register
                        ? Padding(
                            //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            padding: EdgeInsets.only(bottom: 20, top: 20),
                            child: InputField(
                              icon: Icon(Icons.person),
                              hint: "Name",
                              controller: _nameController,
                              obsecure: false,
                            ),
                          )
                        : Container(),
                    Padding(
                      //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: InputField(
                        icon: Icon(Icons.email),
                        hint: "Email",
                        controller: _emailController,
                        obsecure: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: InputField(
                          icon: Icon(Icons.lock),
                          hint: "Password",
                          controller: _passwordController,
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
                                model.titleText(authType),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
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
                           var res = model.login(authType, _emailController.text,
                                _passwordController.text);

                           print ("RES RES RES" + res.toString());

                           if(res is bool){
                             if(res){
                               print ("YESSSSSSSSSSSSSSSSSSSSSSSS");
                             } else {
                               print ("NOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
                             }
                           }


                            if (model.isLoading) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            } else {
                              return null;
                            }

//                            if (model.isLoading) {
//                              return Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                  builder: (context) => HomePage(),
//                                ),
//                              );
//                            }
//                            return null;
                          },
                        ),
                        height: 60,
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          //color: Colors.blue,
        ),
      ),
    ));
  }
}

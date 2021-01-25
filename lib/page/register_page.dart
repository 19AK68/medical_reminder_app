import 'package:flutter/material.dart';
import 'package:medical_reminder/page/home_page.dart';
import 'package:medical_reminder/util/enums/auth_type.dart';
import 'package:medical_reminder/util/enums/login_input_field.dart';
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
    final model = Provider.of<LoginModel>(context, listen: false);

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
                          _nameController.clear();
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
                              inputField: LoginInputField.NAME,
                              icon: Icon(Icons.person),
                              hint: "Name",
                              errorText: model.name.error,
                              controller: _nameController,
                              obsecure: false,
                              onChanged: (String value) {
                                print("value" + value);
                                model.changeName(value);
                              },
                              // validator: (String arg) {
                              //   if (arg.isEmpty) {
                              //     return 'Name cannot be blank';
                              //   }
                              //   if (arg.length < 3)
                              //     return 'Name must be more than 2 charater';
                              //   else
                              //     return null;
                              // },
                            ),
                          )
                        : Container(),
                    Padding(
                      //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: InputField(
                        inputField: LoginInputField.EMAIL,
                        icon: Icon(Icons.email),
                        hint: "Email",
                        errorText: model.email.error,
                        controller: _emailController,
                        obsecure: false,
                        onChanged: (String value) {
                          model.changeEmail(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: InputField(
                        inputField: LoginInputField.PASSWORD,
                        icon: Icon(Icons.lock),
                        hint: "Password",
                        errorText: model.password.error,
                        controller: _passwordController,
                        obsecure: true,
                        onChanged: (String value) {
                          model.changePassword(value);
                        },
                      ),
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
                            model
                                .login(authType, _emailController.text,
                                    _passwordController.text)
                                .then((val) {

                              if (model.isCorrect) {
                                model.connectUserCollection();

                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              } else {
                                return null;
                              }
                            });

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

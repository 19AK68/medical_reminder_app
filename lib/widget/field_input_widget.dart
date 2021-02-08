import 'package:flutter/material.dart';

import 'package:medical_reminder/util/enums/login_input_field.dart';
class InputField extends StatelessWidget {
  final Color primaryColor = Color(0xFF20536c);

  final LoginInputField inputField;
  final Icon icon;
  final String hint;
  final TextEditingController controller;
  final bool obsecure;
  final Function onChanged;
  final String errorText;
  final String initialValue;
  final bool isBorder;
  //final String Function(String) errorText;
  // final String Function(String) validator;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  InputField(
      {this.icon,
      this.hint,
      this.controller,
      this.obsecure,
      this.inputField,
      this.errorText,
      this.onChanged,
      this.initialValue,
      this.isBorder});

  @override
  Widget build(BuildContext context) {
//    final model = Provider.of<LoginModel>(context);

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        obscureText: obsecure,

        //   validator: validator,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor.withOpacity(0.9) //Color(0xFFbdc6cf)
            ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20, color: primaryColor.withOpacity(0.5)),
            hintText: hint ?? " ",
            errorText: errorText,
            //"Error Text", //model.valitedateInput(controller.text, inputField),
            enabledBorder:OutlineInputBorder(
              borderRadius:  BorderRadius.circular(30),
              borderSide: BorderSide(
                color: primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: icon!= null? IconTheme(
                data: IconThemeData(
                  color: primaryColor,
                ),
                child: icon,
              ):Container(),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
        onChanged: onChanged,
      ),
    );
  }
}

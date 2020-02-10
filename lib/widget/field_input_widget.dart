import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Icon icon;
  final String hint;
  final TextEditingController controller;
  final bool obsecure;

  InputField({this.icon, this.hint, this.controller, this.obsecure});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 20,
            color: Color(0xFFbdc6cf)
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle( fontSize: 20,color:Color(0xFF20536c)  ),
            hintText: hint?? " ",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color(0xFF20536c),
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
              child: IconTheme(
                data: IconThemeData(
                  color: Color(0xFF20536c),
                ),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 30, right: 10),
            )),
      ),
    );
  }
}

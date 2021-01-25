import 'package:flutter/material.dart';

class TitleGroupe extends StatelessWidget {
  final String title;
  final bool isRequired;
  final Color spanColor;
  TitleGroupe({
    Key key,
    @required this.title,
    @required this.isRequired,@required this.spanColor,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 4),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: isRequired ? " *" : "",
            style: TextStyle(fontSize: 14, color: spanColor ??  Colors.black),
          ),
        ]),
      ),
    );
  }
}
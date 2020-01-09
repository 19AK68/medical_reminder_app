import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  TitleWidget({
    this.title,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Center(
            child: Text(
              title ?? '',
              //textScaleFactor: UI.textScaleFactor,
              style: TextStyle(
                color: Color.fromRGBO(46, 49, 60, 1),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.26,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: IconButton(
              iconSize: 24,
              icon: Image.asset('assets/ic_back_arrow_gradient.png'),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

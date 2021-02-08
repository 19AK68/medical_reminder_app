import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';


class BaseDialogContentWidget extends StatelessWidget {
  static const LOGO_HEIGHT = 48;
  final Color primaryColor = Color(0xFF20536c);
  //final Color _color = Colors.white;

  final String imagePath;
  final String title;
  final Widget content;
  final Widget bottom;
  final Widget labelBottom;

  BaseDialogContentWidget(
      {this.imagePath,
        this.title,
        this.content,
        this.bottom,
        this.labelBottom});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: UI.marginStandard,
          left: UI.marginStandardDouble,
          right: UI.marginStandardDouble,
          bottom: UI.marginStandard),
     // color: _color,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          imagePath == null
              ? Container()
              : Flexible(
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: UI.marginStandard),
            child: Text(
              title ?? '',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              textScaleFactor: UI.textScaleFactor,
              textAlign: TextAlign.center,
            ),
          ),
          content ?? Container(),
          bottom ?? Container(),
          labelBottom ?? Container(),
        ],
      ),
    );
  }
}

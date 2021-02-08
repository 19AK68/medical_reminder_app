import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';
class ConfirmationDialogWidget extends StatelessWidget {
  final String title;
  final String body;
  final Widget content;
  final String yesButtonTitle;
  final String noButtonTitle;
  final GestureTapCallback onNoPressed;
  final GestureTapCallback onYesPressed;

  ConfirmationDialogWidget({
    this.title,
    this.body,
    this.content,
    this.yesButtonTitle,
    this.noButtonTitle,
    this.onNoPressed,
    this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.marginStandardDouble),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Visibility(
            visible: title != null,
            child: Container(
              margin: EdgeInsets.only(bottom: UI.marginStandard),
              child: Text(
                title ?? '',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
                textScaleFactor: UI.textScaleFactor,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Visibility(
            visible: body != null,
            child: Container(
              height: 400,
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Text(
                    body ?? '',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                    textScaleFactor: UI.textScaleFactor,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          content ?? Container(),
          Visibility(
            visible: onYesPressed != null,
            child: Container(
              margin: EdgeInsets.only(top: UI.marginStandardDouble),
              child: onNoPressed == null
                  ? GradientButton(
                text: yesButtonTitle ?? '',
                onPressed: onYesPressed,
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: BorderButton(
                        onPressed: onNoPressed,
                        title: noButtonTitle ??
                           "No"),
                  ),
                  Container(
                    width: UI.marginStandardDouble,
                  ),
                  Expanded(
                    child: GradientButton(
                      text: yesButtonTitle ??
                         "Yes",
                      onPressed: onYesPressed,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

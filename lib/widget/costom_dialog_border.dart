import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';

/// Used with [showDialog] to create Dialog shape
class CustomDialogBorder extends StatelessWidget {
  static const BORDER_RADIUS = 8.0;
  final Widget child;

  CustomDialogBorder(this.child);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(UI.marginStandard),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(BORDER_RADIUS),
          child: Material(
            child: child,
          ),
        ),
      ),
    );
  }
}
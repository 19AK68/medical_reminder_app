import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class CustomGradient extends LinearGradient {
  static Color colorGreenStart = Color(0xFFA9BB46);
  static Color colorGreenEnd = Color(0xFF5FBB46);

  CustomGradient([Color colorStart, Color colorEnd])
      : super(
          colors: [
            colorStart == null ? colorGreenStart : colorStart,
            colorEnd == null ? colorGreenEnd : colorEnd
          ],
          begin: const FractionalOffset(0.5, 0.0),
          end: const FractionalOffset(0.5, 1),
          stops: [0.0, 1.0],
        );
}

class ScreenDecoration extends BoxDecoration {
  ScreenDecoration()
      : super(
    gradient: CustomGradient(
      Color(0xffFBFCFC),
      Color(0xffEBECED),
    ),
  );
}


class GradientButton extends StatelessWidget {
  final Widget child;
  final Widget iconWidget;
  final Function() onPressed;
  final LinearGradient gradient;

  GradientButton({
    @required this.child,
    @required this.onPressed,
    this.gradient,
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(UI.marginStandard),
      decoration: BoxDecoration(
        gradient: gradient ?? CustomGradient(),
        borderRadius: BorderRadius.circular(UI.buttonRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.black26,
          splashColor: Colors.black12,
          borderRadius: BorderRadius.circular(UI.buttonRadius),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: UI.marginStandard),
                child: iconWidget ?? Container(),
              ),

              /// Centered Button Title with padding
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: UI.marginStandard),
                  child: child,
                ),
              ),

              /// Opacity to center the Title when the IconWidget is supplied
              Opacity(
                opacity: 0,
                child: Container(
                  padding: EdgeInsets.only(right: UI.marginStandard),
                  child: iconWidget ?? Container(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UI {
  // Standard display is Nexus 5 with resolution 1080x1920, where before
  // development of adaptive design all screens looks fine.
  // For this device:
  // MediaQuery.of(context).size = (360.0; 592)
  // MediaQuery.of(context).devicePixelRatio = 3
  static const double STANDARD_DISPLAY_WIDTH = 360.0;
  static const double STANDARD_DISPLAY_HEIGHT = 592.0;

  static const double MAX_SCALE_FACTOR = 1.5;

  static const int PAGE_TRANSITION_DURATION = 500;

  static double _scaleFactorW = 1.0;
  static double _scaleFactorH = 1.0;

  static double marginStandard = _scaleFactorW * 16.0;
  static double marginStandardHalf = _scaleFactorW * 8.0;
  static double marginStandardDouble = _scaleFactorW * 32.0;

  static const double defaultButtonTextSize = 16;
  static const double buttonRadius = 80;

  static double playWidgetHeight = _scaleFactorH * 32;


  static double get scaleFactorW => _scaleFactorW;

  static double get scaleFactorH => _scaleFactorH;

  static double get textScaleFactor => min(_scaleFactorH, _scaleFactorW);



  static bool _adaptiveDesignDone = false;

  static void setAdaptiveDesign(BuildContext context) {
    if (!_adaptiveDesignDone) {
      double newScaleFactorW = min(
          MediaQuery.of(context).size.width / STANDARD_DISPLAY_WIDTH,
          MAX_SCALE_FACTOR) *
          0.9;

      double newScaleFactorH = min(
          MediaQuery.of(context).size.height / STANDARD_DISPLAY_HEIGHT,
          MAX_SCALE_FACTOR);

      if (_scaleFactorW == newScaleFactorW &&
          _scaleFactorH == newScaleFactorH) {
        return;
      }

      _scaleFactorW = newScaleFactorW;
      _scaleFactorH = newScaleFactorH;

      print(
          'Set Adaptive Design. Scale Factors (w=$scaleFactorW; h=$scaleFactorH)');

      marginStandard = _scaleFactorW * 16.0;
      marginStandardHalf = _scaleFactorW * 8.0;
      marginStandardDouble = _scaleFactorW * 32.0;
      playWidgetHeight = _scaleFactorH * 32;
    }
  }
}
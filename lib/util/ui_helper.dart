import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:medical_reminder/util/enums/type_animation.dart';
import 'package:medical_reminder/view_model/base_model.dart';
import 'package:medical_reminder/widget/toast_widget.dart';
import 'package:provider/provider.dart';

class CustomGradient extends LinearGradient {
  static Color colorGreenStart = Color(0xFF20496c); //0xFF20496c
  //static Color colorGreenEnd = Color(0xFF5788A0);
  static Color colorGreenEnd = Color(0xFF20536c);

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
  final String text;
  final Color textColor;
  final Widget iconWidget;
  final Function onPressed;
  final LinearGradient gradient;

  GradientButton({
    this.text,
    this.textColor,
    this.gradient,
    this.iconWidget,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Text(
                    text,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textScaleFactor: UI.textScaleFactor,
                  ),
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

class BorderButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final double borderWidth;
  final Color color;
  final Color backgroundColor;
  final EdgeInsets contentPadding;
  final Function onPressed;

  BorderButton({
    this.title,
    this.fontSize,
    this.borderWidth,
    this.color,
    this.backgroundColor,
    this.contentPadding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UI.buttonRadius),
          side: BorderSide(
            color: color ?? Color(0xFF9BCB3C),
            width: borderWidth ?? UI.scaleFactorW * 2,
          ),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(UI.buttonRadius),
          child: Center(
            child: Container(
              padding: contentPadding ?? EdgeInsets.all(UI.marginStandard),
              child: Text(
                title ??
                    toBeginningOfSentenceCase(MaterialLocalizations.of(context)
                        .cancelButtonLabel
                        .toLowerCase()),
                maxLines: 1,
                style: TextStyle(
                  color: color ?? Color(0xFF9BCB3C),
                  fontSize: fontSize ?? 18,
                  fontWeight: FontWeight.w500,
                ),
                textScaleFactor: UI.textScaleFactor,
              ),
            ),
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

  static TextStyle inputTextStyle() {
    return TextStyle(color: Colors.black87, fontSize: UI.textScaleFactor * 18);
  }

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

  static Future<void> showMessage(BuildContext context, String message) async {
    await ToastWidget.show(message);
  }

  static String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  static String getUsername(String email) {
    return 'live:${email.split('@')[0]}';
  }


  static void navigate<T extends BaseModel>(
      BuildContext context, Widget child, Widget parent,
      {T model, PageAnimationType animationType}) {
    print(
        'Navigate to: ${child.runtimeType}. Caller: ${parent.runtimeType}. Model: ${model.runtimeType}');

    final navigateTo = model == null
        ? child
        : ChangeNotifierProvider<T>(
      create: (context) => model,
      child: child,
    );

    Navigator.of(context).push(_buildRoute(navigateTo, parent, animationType));
  }


  static PageRouteBuilder _buildRoute(
      Widget child, Widget parent, PageAnimationType animationType) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      child,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        switch (animationType) {
          case PageAnimationType.SLIDE_TOP:
            return _SlideTopTransitionAnimation(
                animation: animation, child: child, parent: parent);
          case PageAnimationType.SLIDE_BOTTOM:
            return _SlideBottomTransitionAnimation(
                animation: animation, child: child, parent: parent);
            break;
          case PageAnimationType.HOME_ANIMATION:
            return _HomeTransitionAnimation(
                animation: animation, child: child, parent: parent);
            break;
          case PageAnimationType.SLIDE_LEFT:
          default:
            return _SlideLeftTransitionAnimation(
                animation: animation, child: child, parent: parent);
            break;
        }
      },
      transitionDuration: Duration(milliseconds: PAGE_TRANSITION_DURATION),
    );
  }
}


class _SlideBottomTransitionAnimation extends _BaseTransitionAnimation {
  _SlideBottomTransitionAnimation(
      {Animation<double> animation, Widget child, Widget parent})
      : super(animation: animation, child: child, parent: parent);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(0.0, 0.3),
          ).animate(animation),
          child: parent,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        )
      ],
    );
  }
}

class _HomeTransitionAnimation extends _BaseTransitionAnimation {
  _HomeTransitionAnimation({
    @required animation,
    @required child,
    @required parent,
  }) : super(animation: animation, child: child, parent: parent);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(0.3, 0),
          ).animate(animation),
          child: parent,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ],
    );
  }
}
class _SlideLeftTransitionAnimation extends _BaseTransitionAnimation {
  _SlideLeftTransitionAnimation(
      {Animation<double> animation, Widget child, Widget parent})
      : super(animation: animation, child: child, parent: parent);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(-1.0, 0.0),
          ).animate(animation),
          child: parent,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        )
      ],
    );
  }
}

class _SlideTopTransitionAnimation extends _BaseTransitionAnimation {
  _SlideTopTransitionAnimation(
      {Animation<double> animation, Widget child, Widget parent})
      : super(animation: animation, child: child, parent: parent);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: Offset(0.0, -1.0),
          ).animate(animation),
          child: parent,
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        )
      ],
    );
  }
}

abstract class _BaseTransitionAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Widget parent;

  _BaseTransitionAnimation({
    @required this.animation,
    @required this.child,
    this.parent,
  });
}
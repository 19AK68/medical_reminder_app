import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
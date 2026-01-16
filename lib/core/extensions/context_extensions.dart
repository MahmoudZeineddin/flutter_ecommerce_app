import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double widthPct(double percent) => width * percent;
  double heightPct(double percent) => height * percent;

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;
}

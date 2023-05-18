import 'package:flutter/material.dart';

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getPreciseHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).viewPadding;
  height = height -
      padding.top -
      padding.bottom -
      kToolbarHeight -
      kBottomNavigationBarHeight;
  return height;
}

double getHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).viewPadding;
  height = height - padding.top - padding.bottom;
  return height;
}

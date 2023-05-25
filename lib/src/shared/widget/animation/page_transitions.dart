import 'package:flutter/material.dart';

Widget pageTransitionsAutoroute(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return const FadeUpwardsPageTransitionsBuilder()
      .buildTransitions(null, context, animation, secondaryAnimation, child);
}

Widget pageTransitionsWidget(
    {required Animation<double> animation, required Widget child}) {
  return const FadeUpwardsPageTransitionsBuilder()
      .buildTransitions(null, null, animation, null, child);
}

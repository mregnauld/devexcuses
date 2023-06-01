import 'package:flutter/material.dart';

class RoutesTransitions
{

  static Widget noTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child)
  {
    var tween = Tween(begin: Offset.zero, end: Offset.zero).chain(CurveTween(curve: Curves.linear));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  static Widget verticalTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child)
  {
    var tweenSlide = Tween<Offset>(begin: const Offset(0, -0.2), end: Offset.zero)
        .chain(CurveTween(curve: Curves.easeOut));
    var tweenAlpha = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Curves.easeOut));
    return SlideTransition(
      position: animation.drive(tweenSlide),
      child: FadeTransition(
        opacity: animation.drive(tweenAlpha),
        child: child,
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransitions {
  static CustomTransitionPage shellRouteTransitionAnimation(
          LocalKey key, Widget child) =>
      CustomTransitionPage(
        key: key,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        child: child,
      );
}

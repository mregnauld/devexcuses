import 'package:devexcuses/core/routes/routes_transitions.dart';
import 'package:devexcuses/features/add/presentation/pages/add_excuse_page.dart';
import 'package:devexcuses/features/random/presentation/pages/random_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter
{

  static const randomPage = "random";
  static const addExcusePage = "add_excuse";


  late final router = GoRouter(
    initialLocation: "/$randomPage",
    routes: [
      GoRoute(
        name: randomPage,
        path: "/$randomPage",
        builder: (context, state) => const RandomPage(),
      ),
      GoRoute(
        name: addExcusePage,
        path: "/$addExcusePage",
        pageBuilder: (context, state) => _getPageWithAnimation(
            const AddExcusePage(),
            transition: RoutesTransitions.verticalTransition),
      ),
    ],
  );

  CustomTransitionPage _getPageWithAnimation(Widget page, {Function transition = RoutesTransitions.noTransition})
  {
    int dureeTransitionFinaleMs = (transition == RoutesTransitions.noTransition ? 0 : 250);
    return CustomTransitionPage(
        child: page,
        transitionDuration: Duration(milliseconds: dureeTransitionFinaleMs),
        transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return transition(context, animation, secondaryAnimation, child);
        });
  }

}
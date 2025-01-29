// routes def
import 'package:auth/src/presentation/ui/pages/account_page.dart';
import 'package:auth/src/presentation/ui/pages/auth_page.dart';
import 'package:auth/src/presentation/ui/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

List<RouteBase> get authRoutes => $appRoutes;

@TypedGoRoute<AuthRoute>(path: '/auth', routes: [
  TypedGoRoute<SignInRoute>(path: 'sign_in'),
  TypedGoRoute<AccountRoute>(path: 'account'),
])

// classes
@immutable
class AuthRoute extends GoRouteData {
  const AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthPage();
}

@immutable
class AccountRoute extends GoRouteData {
  const AccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AccountPage();
}

@immutable
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SignInPage(),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}

import 'package:admin_panel_flutter/src/presnentation/pages/home_page.dart';
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> routerKey =
    GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@Riverpod()
GoRouter router(Ref ref) => GoRouter(
      navigatorKey: routerKey,
      initialLocation: const HomeRoute().location,
      debugLogDiagnostics: true,
      routes: $appRoutes + authRoutes,
      // observers: [FirebaseAnaliticsService().observer],
    );

// routes def
@TypedGoRoute<HomeRoute>(path: '/', routes: [])

// classes

@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

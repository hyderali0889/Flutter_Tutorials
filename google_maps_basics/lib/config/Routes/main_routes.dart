import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_basics/config/Routes/route_names.dart';
import 'package:google_maps_basics/view/pages/sen_screen.dart';
import '../../view/pages/Navigation/bottom_nav.dart';
import '../../view/pages/map_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/map',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: routes),
  ],
);

final List<RouteBase> routes = [
  GoRoute(
    name: sen,
    path: "/$sen",
    builder: (BuildContext context, GoRouterState state) {
      return const SenScreen();
    },
    routes: const <RouteBase>[],
  ),
  GoRoute(
    name: map,
    path: "/$map",

    builder: (BuildContext context, GoRouterState state) {
      return const MapScreen();
    },
    routes: const <RouteBase>[],
  ),
];

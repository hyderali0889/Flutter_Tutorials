import 'package:go_router/go_router.dart';
import 'package:riverpod_basics/View/Routes/routes.dart';
import 'package:riverpod_basics/View/Screens/sec_screen.dart';
import 'package:riverpod_basics/View/Screens/future_screen.dart';

import '../Screens/home_screen.dart';

final GoRouter router = GoRouter(
  routes: route,
  initialLocation: "/",
);

List<RouteBase> route = [
  GoRoute(
    name: Routes().home,
    path: "/",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    name: Routes().second,
    path: "/sec/:dat",
    builder: (context, state) => SecondScreen(
      data: state.pathParameters["dat"].toString(),
    ),
  ),
  GoRoute(
    name: Routes().future,
    path: "/future",
    builder: (context, state) =>const FutureScreen()
  ),
];

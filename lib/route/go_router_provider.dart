import 'package:easypay/screens/first_registration_screen.dart';
import 'package:easypay/screens/login_screen.dart';
import 'package:easypay/screens/home_screen.dart';

import 'package:easypay/route/named_routes.dart';
import 'package:easypay/screens/splash_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: NamedRoutes.splash,
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          name: NamedRoutes.login,
          path: 'login',
          builder: (context, state) => LoginScreen(
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: NamedRoutes.registration1,
          path: 'registration1',
          builder: (context, state) => FirstRegistrationScreen(
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: NamedRoutes.home,
          path: 'home',
          builder: (context, state) => HomeScreen(
            key: state.pageKey,
          ),
        ),
      ],
    ),
  ]);
});

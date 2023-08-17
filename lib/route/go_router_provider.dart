import 'package:easypay/common/widgets/loader.dart';
import 'package:easypay/route/go_router_notifier.dart';
import 'package:easypay/screens/first_registration_screen.dart';
import 'package:easypay/screens/fourth_registration_screen.dart';
import 'package:easypay/screens/login_screen.dart';
import 'package:easypay/screens/home_screen.dart';

import 'package:easypay/route/named_routes.dart';
import 'package:easypay/screens/orders_page.dart';
import 'package:easypay/screens/second_registration_screen.dart';
import 'package:easypay/screens/single_order_screen.dart';
import 'package:easypay/screens/splash_screen.dart';
import 'package:easypay/screens/third_registration_screen.dart';
import 'package:easypay/screens/verify_otp_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            redirect: (context, state) async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();

              if (prefs.getString("access_token") != null) {
                return '/home';
              }
              return '/login';
            }),
        GoRoute(
          name: NamedRoutes.verifyOtp,
          path: 'verifyOtp',
          builder: (context, state) => VerifyOtpScreen(
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: NamedRoutes.loading,
          path: 'loading',
          builder: (context, state) => Loader(
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
          name: NamedRoutes.registration2,
          path: 'registration2',
          builder: (context, state) => SecondRegistrationScreen(
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: NamedRoutes.registration3,
          path: 'registration3',
          builder: (context, state) => ThirdRegistrationScreen(
            key: state.pageKey,
          ),
        ),
        GoRoute(
          name: NamedRoutes.registration4,
          path: 'registration4',
          builder: (context, state) => FourthRegistrationScreen(
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
        GoRoute(
          name: NamedRoutes.allOrders,
          path: 'allOrders',
          builder: (context, state) => OrdersPage(
            key: state.pageKey,
          ),
        ),
      ],
    ),
  ]);
});

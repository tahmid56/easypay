import 'package:easypay/constants/theme.dart';
import 'package:easypay/route/go_router_notifier.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    navigator();
    super.initState();
  }

  Future navigator() async {
    final isLoggedIn = ref.read(loggedInProvider);
    await Future.delayed(const Duration(milliseconds: 3000));
    if (isLoggedIn.getLoggedInStatus()) {
      return GoRouter.of(context).pushReplacementNamed(NamedRoutes.home);
    } else {
      return GoRouter.of(context).pushReplacementNamed(NamedRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   stops: [0.1, 0.4, 0.6, 0.9],
            //   colors: [
            //     Color(0xfffff7ad),
            //     Color(0xffffa9f9),
            //     Color(0xff62ffe3),
            //     Color(0xff63dbc5)
            //   ],
            // ),
            color: Color(0xff000000)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/easypayLogo.png",
              height: 200,
              width: 300,
            ),
            const Text(
              "easypay",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Color(0xff00c2e4),
                  fontFamily: CustomTheme.fontFamily),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Buy now, Pay later",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xff00c2e4),
                  fontFamily: CustomTheme.fontFamily),
            ),
          ],
        )),
      ),
    );
  }
}

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
    final isLoggedIn = ref.read(goRouteNotifierProvider).isLoggedIn;
    await Future.delayed(const Duration(milliseconds: 2000));
    if (isLoggedIn) {
      return GoRouter.of(context).pushReplacementNamed(NamedRoutes.home);
    } else {
      return GoRouter.of(context).pushReplacementNamed(NamedRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/gg2.png",
              height: 200,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}

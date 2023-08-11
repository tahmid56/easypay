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
    return Container(
      decoration: BoxDecoration(color: Colors.grey[900]),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Image.asset(
          "assets/images/logo4.png",
          height: 200,
          width: 300,
        ),
      ),
    );
  }
}

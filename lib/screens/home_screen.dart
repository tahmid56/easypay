import 'package:easypay/constants/theme.dart';
import 'package:easypay/screens/home_page.dart';
import 'package:easypay/screens/more_page.dart';
import 'package:easypay/screens/orders_page.dart';
import 'package:easypay/screens/settings_page.dart';
import 'package:easypay/screens/shops_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageIndexProvider = StateProvider<int>((ref) => 1);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Widget> navigationOptions = [
    const ShopsPage(),
    const HomePage(),
    const MorePage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.4, 0.6, 0.9],
            colors: [
              Color(0xfffff7ad),
              Color(0xffffa9f9),
              Color(0xff62ffe3),
              Color(0xff63dbc5)
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: navigationOptions[ref.watch(pageIndexProvider)],
            bottomNavigationBar: Container(
              height: 90,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10)
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed, // Fixed
                  backgroundColor: const Color(0xffffffff),
                  elevation: 0.0,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  selectedIconTheme: const IconThemeData(
                    color: null,
                    size: 40,
                  ),
                  showSelectedLabels: false,
                  showUnselectedLabels: true,
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.black, size: 30),
                  selectedLabelStyle: const TextStyle(color: Colors.blue),
                  currentIndex: ref.watch(pageIndexProvider),
                  onTap: (index) {
                    ref.watch(pageIndexProvider.notifier).state = index;
                    setState(() {});
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/icons/cartIcon.png")),
                      label: "Shops",
                      activeIcon: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                            child: FittedBox(
                              child: ImageIcon(
                                AssetImage(
                                  "assets/icons/cartIcon.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: const Text(
                              "Shops",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/icons/checkIcon.png")),
                      label: "Orders",
                      activeIcon: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                            child: FittedBox(
                              child: ImageIcon(
                                AssetImage(
                                  "assets/icons/checkIcon.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: const Text(
                              "Orders",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/icons/badgeIcon.png")),
                      label: "Rewards",
                      activeIcon: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                            child: FittedBox(
                              child: ImageIcon(
                                AssetImage(
                                  "assets/icons/badgeIcon.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: const Text(
                              "Rewards",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/icons/profileIcon.png")),
                      label: "My Easypay",
                      activeIcon: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                            width: 30,
                            child: FittedBox(
                              child: ImageIcon(
                                AssetImage(
                                  "assets/icons/profileIcon.png",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                            child: const Text(
                              "My Easypay",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

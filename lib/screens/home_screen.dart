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
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: navigationOptions[ref.watch(pageIndexProvider)],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color(0xffB3EDF7),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Fixed
              backgroundColor: const Color(0xffB3EDF7),
              elevation: 0.0,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(
                color: null,
                size: 30,
              ),
              showSelectedLabels: true,
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
                  icon:
                      const ImageIcon(AssetImage("assets/icons/cartIcon.png")),
                  label: "Shops",
                  // activeIcon: Column(
                  //   children: [
                  //     const SizedBox(
                  //       height: 30,
                  //       width: 30,
                  //       child: FittedBox(
                  //         child: ImageIcon(
                  //           AssetImage(
                  //             "assets/icons/cartIcon.png",
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 4,
                  //     ),
                  //     Container(
                  //       decoration: const BoxDecoration(
                  //         color: Colors.blue,
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(40),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         "Shops",
                  //         style: TextStyle(
                  //             fontFamily: CustomTheme.fontFamily,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
                BottomNavigationBarItem(
                  icon:
                      const ImageIcon(AssetImage("assets/icons/checkIcon.png")),
                  label: "Orders",
                  // activeIcon: Column(
                  //   children: [
                  //     const SizedBox(
                  //       height: 30,
                  //       width: 30,
                  //       child: FittedBox(
                  //         child: ImageIcon(
                  //           AssetImage(
                  //             "assets/icons/checkIcon.png",
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 4,
                  //     ),
                  //     Container(
                  //       decoration: const BoxDecoration(
                  //         color: Colors.blue,
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(40),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         "Orders",
                  //         style: TextStyle(
                  //             fontFamily: CustomTheme.fontFamily,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage("assets/icons/easypayLogo.png"),
                    size: 36,
                  ),
                  label: "My Easypay",
                  // activeIcon: Column(
                  //   children: [
                  //     const SizedBox(
                  //       height: 30,
                  //       width: 30,
                  //       child: FittedBox(
                  //         child: ImageIcon(
                  //           AssetImage(
                  //             "assets/icons/profileIcon.png",
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 4,
                  //     ),
                  //     Container(
                  //       decoration: const BoxDecoration(
                  //         color: Colors.blue,
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(40),
                  //         ),
                  //       ),
                  //       child: const Text(
                  //         "My Easypay",
                  //         style: TextStyle(
                  //             fontFamily: CustomTheme.fontFamily,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:easypay/screens/home_page.dart';
import 'package:easypay/screens/more_page.dart';
import 'package:easypay/screens/orders_page.dart';
import 'package:easypay/screens/settings_page.dart';
import 'package:easypay/screens/shops_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 2;
  List<Widget> navigationOptions = [
    const MorePage(),
    const ShopsPage(),
    const HomePage(),
    const OrdersPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationOptions[selectedPage],
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
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Fixed
              backgroundColor: Colors.grey[300],
              elevation: 0.0,
              selectedItemColor: Colors.lime[400],
              unselectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(
                color: null,
                size: 40,
              ),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedIconTheme:
                  const IconThemeData(color: Colors.black, size: 30),
              selectedLabelStyle: const TextStyle(color: Color(0xffD2E063)),
              currentIndex: selectedPage,
              onTap: (index) {
                selectedPage = index;
                setState(() {});
              },
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: "Shops",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: "Orders",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/icons/easypayLogo.png",
                    height: 50,
                  ),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: "Orders",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: "Settings",
                ),
              ],
            ),
          ),
        ));
  }
}

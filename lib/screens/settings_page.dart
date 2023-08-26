import 'package:easypay/constants/theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Color(0xffB3EDF7),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("assets/images/logo4.png"),
                      height: 20,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning,",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: CustomTheme.fontFamily,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "User",
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: CustomTheme.fontFamily,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: const FittedBox(
                              fit: BoxFit.cover,
                              child: ImageIcon(
                                  AssetImage("assets/images/profileLogo.png")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Total you owe",
                    style: TextStyle(
                        fontFamily: CustomTheme.fontFamily, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "BDT 6000",
                    style: TextStyle(
                        fontFamily: CustomTheme.fontFamily, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Pre approved to spend 25000",
                    style: TextStyle(
                        fontFamily: CustomTheme.fontFamily,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("Delivery Address"),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffe7e7e7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 40,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: ImageIcon(
                        AssetImage("assets/icons/delivaryCar.png"),
                      ),
                    ),
                  ),
                ),
                Text(
                  "House 1, road 12, Baridhara",
                  style: TextStyle(
                      fontFamily: CustomTheme.fontFamily, fontSize: 18),
                ),
                Icon(Icons.expand_circle_down_outlined)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("Payment Method"),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffe7e7e7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 40,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: ImageIcon(
                        AssetImage("assets/icons/visaIcon.png"),
                      ),
                    ),
                  ),
                ),
                Text(
                  "4231**** **** 5678",
                  style: TextStyle(
                      fontFamily: CustomTheme.fontFamily, fontSize: 18),
                ),
                Icon(Icons.expand_circle_down_outlined)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

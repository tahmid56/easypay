import 'package:easypay/constants/theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: const FittedBox(
                fit: BoxFit.fitHeight,
                child: ImageIcon(
                  AssetImage(
                    "assets/images/logo4.png",
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Hi, John Doe",
              style:
                  TextStyle(fontFamily: CustomTheme.fontFamily, fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: const FittedBox(
                  fit: BoxFit.cover,
                  child: ImageIcon(AssetImage("assets/images/profileLogo.png")),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Total you owe",
            style: TextStyle(fontFamily: CustomTheme.fontFamily, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "BDT 6000",
            style: TextStyle(fontFamily: CustomTheme.fontFamily, fontSize: 20),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              color: Colors.black,
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

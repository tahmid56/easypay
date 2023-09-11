import 'package:easypay/constants/theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.38,
          decoration: const BoxDecoration(
            color: Color(0xffB3EDF7),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
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
                  height: 20,
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
                              fontSize: 24,
                              fontFamily: CustomTheme.fontFamily,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "User",
                            style: TextStyle(
                              fontSize: 34,
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
                  height: 30,
                ),
                const Text(
                  "Total you owe:",
                  style: TextStyle(
                    fontFamily: CustomTheme.fontFamily,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "BDT 6000",
                  style: TextStyle(
                      fontFamily: CustomTheme.fontFamily,
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Pre approved to spend limit: BDT 25000",
                  style: TextStyle(
                    fontFamily: CustomTheme.fontFamily,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "On time payments will increase your limit",
                  style: TextStyle(fontFamily: CustomTheme.fontFamily),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xffe7e7e7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Upcoming payments",
                    style: TextStyle(fontFamily: CustomTheme.fontFamily),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/icons/daraz.png',
                          height: 60,
                          width: 50,
                        ),
                      ),
                      const Text(
                        "17th Aug 2023",
                        style: TextStyle(fontFamily: CustomTheme.fontFamily),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            "BDT.3500",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: CustomTheme.fontFamily),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            width: 70,
                            decoration: BoxDecoration(
                                color: const Color(0xffD2E063),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 6),
                              child: Text(
                                "Pay now",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: CustomTheme.fontFamily,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xffe7e7e7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Preferred payment method",
                    style: TextStyle(fontFamily: CustomTheme.fontFamily),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/icons/visaIcon.png',
                              height: 70,
                              width: 50,
                            ),
                          ),
                          const Text(
                            "Visa Card",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      const Text(
                        "5432 **** **** 1123",
                        style: TextStyle(fontFamily: CustomTheme.fontFamily),
                      ),
                      const Column(
                        children: [
                          SizedBox(
                            height: 42,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add a new card",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 9),
                              ),
                              Text(
                                "change payment",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 9),
                              ),
                              Text(
                                "method",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 9),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          
        )
      ],
    );
  }
}

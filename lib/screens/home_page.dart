import 'package:easypay/constants/theme.dart';
import 'package:easypay/providers/user_provider.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:easypay/screens/single_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userRepositoryProvider);
    debugPrint(user?.data.fullName.toString());
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Color(0xffb3edf7),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Orders",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: CustomTheme.fontFamily,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ImageIcon(
                                  AssetImage("assets/icons/easypayLogo.png")),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Text(
                          "Hi,",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          "User",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 70,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: ImageIcon(
                                AssetImage("assets/icons/takaIcon.png"),
                              ),
                            ),
                          ),
                          Text(
                            "6000",
                            style: TextStyle(
                              fontFamily: CustomTheme.fontFamily,
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Total you owe",
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: CustomTheme.fontFamily,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Pre approved to spend: 25000",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: CustomTheme.fontFamily,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 35,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: ImageIcon(
                                AssetImage("assets/icons/takaIcon.png"),
                              ),
                            ),
                          ),
                          Text(
                            "6000",
                            style: TextStyle(
                                fontFamily: CustomTheme.fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Due in 15 days",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: CustomTheme.fontFamily,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 35,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: ImageIcon(
                                AssetImage("assets/icons/takaIcon.png"),
                              ),
                            ),
                          ),
                          Text(
                            "12000",
                            style: TextStyle(
                                fontFamily: CustomTheme.fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Due in 30 days",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: CustomTheme.fontFamily,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 35,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: ImageIcon(
                                AssetImage("assets/icons/takaIcon.png"),
                              ),
                            ),
                          ),
                          Text(
                            "18000",
                            style: TextStyle(
                                fontFamily: CustomTheme.fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Due in 45 days",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: CustomTheme.fontFamily,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff212529),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.cyan),
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              "Upcoming payments",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(NamedRoutes.allOrders);
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "All Orders",
                                style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey, width: 3)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width: 5,
                                  color: Color(0xff00C2E4),
                                )),
                            child: const Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: CustomTheme.fontFamily,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          title: const Text(
                            "Yellow Shopping",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: CustomTheme.fontFamily,
                                color: Colors.black),
                          ),
                          subtitle: const Text(
                            "Wed, 25 August",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: CustomTheme.fontFamily,
                                color: Colors.black),
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return const SingleOrder(
                                      id: "1",
                                    );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffD2E063),
                                  borderRadius: BorderRadius.circular(6)),
                              child: const Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  "Pay BDT 2212",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: CustomTheme.fontFamily,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width: 5,
                                  color: const Color(0xff00C2E4),
                                )),
                            child: const Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: CustomTheme.fontFamily,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          title: const Text(
                            "Yellow Shopping",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: CustomTheme.fontFamily,
                                color: Colors.black),
                          ),
                          subtitle: const Text(
                            "Wed, 25 August",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: CustomTheme.fontFamily,
                                color: Colors.black),
                          ),
                          trailing: const Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "BDT 2212",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: CustomTheme.fontFamily,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

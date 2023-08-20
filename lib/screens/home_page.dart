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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffE7E7E7),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                const Text(
                  "Orders",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: CustomTheme.fontFamily,
                      color: Colors.black),
                ),
                const Row(
                  children: [
                    SizedBox(
                      height: 55,
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
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Text("Total you owe",
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: CustomTheme.fontFamily,
                        color: Colors.black)),
                const SizedBox(height: 30),
                const Text(
                  "Pre approved to spend: BDT 25000.0",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: CustomTheme.fontFamily,
                      color: Colors.black),
                ),
                const Divider(
                  height: 80,
                  thickness: 2,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(
                      width: 30,
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
                          "Due in 40 days",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: CustomTheme.fontFamily,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
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
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.cyan),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Upcoming payments",
                              style: TextStyle(
                                  fontFamily: CustomTheme.fontFamily,
                                  color: Colors.cyan),
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
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Container(
                            child: Center(
                              child: const Text(
                                "3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: CustomTheme.fontFamily,
                                    color: Colors.black),
                              ),
                            ),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width: 5,
                                  color: Color(0xff00C2E4),
                                )),
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
                                  borderRadius: BorderRadius.circular(10)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:easypay/constants/theme.dart';
import 'package:easypay/models/user.dart';
import 'package:easypay/providers/upcoming_payments.dart';
import 'package:easypay/providers/user_provider.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:easypay/screens/single_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
            child: Consumer(builder: (context, ref, child) {
          final upcomingPayments = ref.watch(upcomingPaymentProvider(context));
          final user = ref.watch(userRepositoryProvider);
          debugPrint(user?.data.fullName);
          return upcomingPayments.when(
              data: (data) {
                debugPrint(data?.creditLimit.toString());
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(upcomingPaymentProvider(context));
                  },
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      child: ImageIcon(AssetImage(
                                          "assets/icons/easypayLogo.png")),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Text(
                                  ref
                                      .read(userRepositoryProvider.notifier)
                                      .getUserName(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    height: 70,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: ImageIcon(
                                        AssetImage("assets/icons/takaIcon.png"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data?.totalDueAmount.toString() ?? "0",
                                    style: const TextStyle(
                                      fontFamily: CustomTheme.fontFamily,
                                      fontSize: 64,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
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
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  "Pre approved to spend: ${data?.creditLimit.toString() ?? 0}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: CustomTheme.fontFamily,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 35,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: ImageIcon(
                                        AssetImage("assets/icons/takaIcon.png"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data?.duesIn15Days?[0].totalDueAmount
                                            .toString() ??
                                        "0",
                                    style: const TextStyle(
                                        fontFamily: CustomTheme.fontFamily,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
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
                                  const SizedBox(
                                    height: 35,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: ImageIcon(
                                        AssetImage("assets/icons/takaIcon.png"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data?.duesIn30Days?[0].totalDueAmount
                                            .toString() ??
                                        "0",
                                    style: const TextStyle(
                                        fontFamily: CustomTheme.fontFamily,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
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
                                  const SizedBox(
                                    height: 35,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: ImageIcon(
                                        AssetImage("assets/icons/takaIcon.png"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data?.duesIn45Days?[0].totalDueAmount
                                            .toString() ??
                                        "0",
                                    style: const TextStyle(
                                        fontFamily: CustomTheme.fontFamily,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: data?.upcomingPayments?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                              fontFamily:
                                                  CustomTheme.fontFamily,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      data?.upcomingPayments?[index].merchant
                                              ?.storeName ??
                                          "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: CustomTheme.fontFamily,
                                          color: Colors.black),
                                    ),
                                    subtitle: Text(
                                      DateFormat('MMM, dd, yyyy').format(data
                                          ?.upcomingPayments?[index]
                                          .upcomingDuesInstallment?[0]
                                          .dueDate as DateTime),
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontFamily: CustomTheme.fontFamily,
                                          color: Colors.black),
                                    ),
                                    trailing: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) {
                                              return SingleOrder(
                                                id: data
                                                    ?.upcomingPayments?[index]
                                                    .orderId
                                                    .toString() as String,
                                                imgUrl: "",
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xffD2E063),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Padding(
                                          padding:const EdgeInsets.all(7.0),
                                          child: Text(
                                            data
                                                    ?.upcomingPayments?[index]
                                                    .upcomingDuesInstallment?[0]
                                                    .dueAmount
                                                    .toString() ??
                                                "0",
                                            style:const TextStyle(
                                                fontSize: 10,
                                                fontFamily:
                                                    CustomTheme.fontFamily,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
              loading: () => const Center(child: CircularProgressIndicator()));
        })),
      ),
    );
  }
}

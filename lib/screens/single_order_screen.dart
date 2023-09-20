import 'package:easypay/constants/theme.dart';
import 'package:easypay/providers/order_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../constants/url.dart';

class SingleOrder extends StatelessWidget {
  final String id;
  final String imgUrl;
  const SingleOrder({super.key, required this.id, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(child: Consumer(
            builder: (context, ref, child) {
              final orderDetail = ref.watch(orderDetailsProvider(id));
              return orderDetail.when(
                  data: (data) {
                    final firstDue =
                        data!.dues.firstWhere((due) => due.isPaid == false);
                    return RefreshIndicator(
                      onRefresh: () async {
                        ref.refresh(orderDetailsProvider(id));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 10, left: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffe7e7e7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "This Order",
                                            style: TextStyle(
                                              fontSize: 34,
                                              fontFamily:
                                                  CustomTheme.fontFamily,
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
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          width: 90,
                                          child: Image.network(
                                              "${Urls.baseUrl}$imgUrl"),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.order.merchant.storeName,
                                              style: const TextStyle(
                                                  fontSize: 24,
                                                  fontFamily:
                                                      CustomTheme.fontFamily),
                                            ),
                                            Text(
                                              "BDT ${data.order.totalAmount}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily:
                                                      CustomTheme.fontFamily),
                                            ),
                                            Text(
                                              DateFormat('dd, MMM, yyyy')
                                                  .format(firstDue.dueDate),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      CustomTheme.fontFamily),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "BDT ${data.order.remainingDueAmount}",
                                          style: const TextStyle(
                                              fontSize: 60,
                                              fontWeight: FontWeight.w600,
                                              fontFamily:
                                                  CustomTheme.fontFamily,
                                              color: Colors.black),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            "remaining",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontFamily:
                                                    CustomTheme.fontFamily,
                                                color: Colors.black),
                                          ),
                                        ),
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width * 0.95,
                                decoration: const BoxDecoration(
                                  color: Color(0xffe7e7e7),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.wallet),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          const Text("Payment Method"),
                                          const Spacer(),
                                          Container(
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: const Color(0xff00c2e4),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "change",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: ImageIcon(AssetImage(
                                                "assets/icons/visaIcon.png")),
                                          ),
                                          SizedBox(width: 25),
                                          Text(
                                            "5442 **** 1231",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Payment breakdown")),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              itemCount: data.dues.length,
                              itemBuilder: (context, index) => ListTile(
                                leading: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            width: 1,
                                            color: firstDue.id ==
                                                    data.dues[index].id
                                                ? Colors.pinkAccent
                                                : data.dues[index].isPaid
                                                    ? const Color(0xff00C2E4)
                                                    : Colors.white,
                                          )),
                                      child: Center(
                                        child: Text(
                                          "${index + 1}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily:
                                                  CustomTheme.fontFamily,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  "${data.dues[index].installment} payment",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: CustomTheme.fontFamily,
                                      color: CustomTheme.primaryTextColor),
                                ),
                                subtitle: Text(
                                  DateFormat('dd, MMM, yyyy')
                                      .format(data.dues[index].dueDate),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: CustomTheme.fontFamily,
                                      color: CustomTheme.primaryTextColor),
                                ),
                                trailing: firstDue.id == data.dues[index].id
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            "Pay BDT ${data.dues[index].dueAmount}",
                                            style: const TextStyle(
                                                fontSize: 11,
                                                fontFamily:
                                                    CustomTheme.fontFamily,
                                                color: CustomTheme
                                                    .primaryTextColor),
                                          ),
                                        ),
                                      )
                                    : data.dues[index].isPaid
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "BDT ${data.dues[index].dueAmount}",
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: CustomTheme
                                                          .fontFamily,
                                                      color: CustomTheme
                                                          .primaryTextColor),
                                                ),
                                                const Text(
                                                  "PAID",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: CustomTheme
                                                          .fontFamily,
                                                      color: CustomTheme
                                                          .primaryTextColor),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Text(
                                              "BDT ${data.dues[index].dueAmount}",
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                                fontFamily: 'Italian Plate 2',
                                              ),
                                            ),
                                          ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text('Error: $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()));
            },
          )),
        ),
      ),
    );
  }
}

import 'package:easypay/constants/theme.dart';
import 'package:easypay/providers/order_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SingleOrder extends StatelessWidget {
  final String id;
  const SingleOrder({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.primaryColor,
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
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.grey,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat('dd, MMM, yyyy')
                                        .format(firstDue.dueDate),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: CustomTheme.fontFamily,
                                        color: CustomTheme.secondaryColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data.order.merchant.storeName,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: CustomTheme.fontFamily,
                                        color: CustomTheme.secondaryColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "BDT ${data.order.totalAmount}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: CustomTheme.fontFamily,
                                        color: CustomTheme.secondaryColor),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 30.0, right: 30),
                                    child: Divider(
                                      height: 25,
                                      thickness: 1.5,
                                    ),
                                  ),
                                  Text(
                                    "BDT ${data.order.remainingDueAmount}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: CustomTheme.fontFamily,
                                        color: CustomTheme.secondaryColor),
                                  ),
                                  const Text(
                                    "Remaining",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: CustomTheme.fontFamily,
                                        color: CustomTheme.secondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width: 80,
                                  child: Image.asset("assets/images/gg.png")),
                              const Text(
                                "....4538",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: CustomTheme.fontFamily,
                                    color: Colors.white),
                              ),
                              const Text(
                                "Change",
                                style: TextStyle(
                                    color: Color(0xff00C2E4),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Italian Plate 2'),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
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
                                              color: Colors.white),
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
                                      color: CustomTheme.secondaryColor),
                                ),
                                subtitle: Text(
                                  DateFormat('dd, MMM, yyyy')
                                      .format(data.dues[index].dueDate),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontFamily: CustomTheme.fontFamily,
                                      color: Colors.white),
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
                                                color:
                                                    CustomTheme.secondaryColor),
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
                                                          .secondaryColor),
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
                                                          .secondaryColor),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.all(7.0),
                                            child: Text(
                                                "BDT ${data.dues[index].dueAmount}",
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.grey,
                                                    fontFamily:
                                                        'Italian Plate 2')),
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

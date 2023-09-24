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
        child: SingleChildScrollView(child: Consumer(
          builder: (context, ref, child) {
            final orderDetail = ref.watch(orderDetailsProvider(id));
            return orderDetail.when(
                data: (data) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(orderDetailsProvider(id));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 90,
                                        child: imgUrl != ""
                                            ? Image.network(
                                                "${Urls.baseUrl}$imgUrl")
                                            : const ImageIcon(AssetImage(
                                                "assets/icons/easypayLogo.png")),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data?.order?.merchant?.storeName ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontFamily:
                                                    CustomTheme.fontFamily),
                                          ),
                                          Text(
                                            "BDT ${data?.order?.totalAmount}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w800,
                                                fontFamily:
                                                    CustomTheme.fontFamily),
                                          ),
                                          Text(
                                            DateFormat('dd, MMM, yyyy').format(
                                                data?.dues?.isNotEmpty == true
                                                    ? data?.dues
                                                        ?.firstWhere((due) =>
                                                            due.isPaid == false)
                                                        ?.dueDate
                                                    : DateTime.now()),
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
                                        "BDT ${data?.order?.remainingDueAmount}",
                                        style: const TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: CustomTheme.fontFamily,
                                            color: Colors.black),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data?.dues?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 14),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${index == 0 ? "1st" : index == 1 ? "2nd" : index == 2 ? "3rd" : "4th"} Payment",
                                          style: const TextStyle(
                                              fontFamily:
                                                  CustomTheme.fontFamily),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 50,
                                          child: Image.asset(index == 0
                                              ? "assets/icons/payment_1.png"
                                              : index == 1
                                                  ? "assets/icons/payment_2.png"
                                                  : index == 2
                                                      ? "assets/icons/payment_3.png"
                                                      : "assets/icons/payment_4.png"),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data?.dues?[index].isPaid
                                              ? "Paid"
                                              : "Not Yet Done",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  CustomTheme.fontFamily),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "BDT ${data?.dues?[index].dueAmount}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  CustomTheme.fontFamily),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        data?.dues?[index].isPaid
                                            ? Text(
                                                DateFormat('dd, MMM, yyyy')
                                                    .format(data
                                                        ?.dues?[index].dueDate),
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              )
                                            : data?.dues
                                                        ?.firstWhere((due) =>
                                                            due.isPaid == false)
                                                        .id ==
                                                    data?.dues?[index].id
                                                ? Container(
                                                    height: 20,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: const Color(
                                                          0xffd0e062),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "Pay",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                CustomTheme
                                                                    .fontFamily),
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 20,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: const Color(
                                                          0xffe7e7e7),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "Pay",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                CustomTheme
                                                                    .fontFamily),
                                                      ),
                                                    ),
                                                  ),
                                      ],
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
                loading: () =>
                    const Center(child: CircularProgressIndicator()));
          },
        )),
      ),
    );
  }
}

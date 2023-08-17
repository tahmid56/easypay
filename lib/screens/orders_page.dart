import 'package:easypay/constants/theme.dart';
import 'package:easypay/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/order_list_tile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.4, 0.6, 0.9],
          colors: [
            Color(0xfffff7ad),
            Color(0xffffa9f9),
            Color(0xff62ffe3),
            Color(0xff63dbc5)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 4, right: 4),
              child: Consumer(
                builder: (context, ref, child) {
                  final orders = ref.watch(ordersProvider(context));
                  return orders.when(
                      data: (data) {
                        return RefreshIndicator(
                            onRefresh: () async {
                              ref.refresh(ordersProvider(context));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BDT ${data?.dueTotalAmount}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: CustomTheme.fontFamily,
                                      color: Colors.black),
                                ),
                                const Text(
                                  "Total you owe",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: CustomTheme.fontFamily,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    child: ListView.builder(
                                        itemCount: data?.data.length ?? 0,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: OrderListTile(
                                              date: data!
                                                  .data[index].purchasedDate,
                                              imgUrl:
                                                  data.data[index].storeImgLink,
                                              titleText:
                                                  data.data[index].storeName,
                                              price: data.data[index].amount,
                                              id: data.data[index].orderId
                                                  .toString(),
                                            ),
                                          );
                                        }))
                              ],
                            ));
                      },
                      error: (error, stackTrace) =>
                          Center(child: Text('Error: $error')),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// ListView(
//                     children: const [
//                       OrderListTile(
//                         date: "Sun, 6 August",
//                         imgUrl: "assets/icons/ajkerdeal.png",
//                         titleText: "Ajkerdeal",
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       OrderListTile(
//                         date: "Sun, 20 August",
//                         imgUrl: "assets/icons/bagdoom.png",
//                         titleText: "Bagdoom",
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       OrderListTile(
//                         date: "Sun, 10 October",
//                         imgUrl: "assets/icons/daraz.png",
//                         titleText: "Daraz",
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       OrderListTile(
//                         date: "Sun, 1 November",
//                         imgUrl: "assets/icons/rokomari.png",
//                         titleText: "Rokomari",
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),


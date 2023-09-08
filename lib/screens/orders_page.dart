import 'package:easypay/constants/theme.dart';
import 'package:easypay/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/order_list_tile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffe7e7e7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "All Orders",
                                              style: TextStyle(
                                                fontSize: 40,
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
                                          const SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: ImageIcon(
                                              AssetImage(
                                                "assets/icons/takaIcon.png",
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${data?.dueTotalAmount}",
                                            style: const TextStyle(
                                                fontSize: 70,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    CustomTheme.fontFamily,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: const Text(
                                          "Total you owe",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily:
                                                  CustomTheme.fontFamily,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(12)),
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: ListView.builder(
                                      itemCount: data?.data.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: OrderListTile(
                                            date:
                                                data!.data[index].purchasedDate,
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


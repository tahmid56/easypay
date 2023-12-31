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
      body: Consumer(
        builder: (context, ref, child) {
          final orders = ref.watch(ordersProvider(context));
          return orders.when(
              data: (data) {
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(ordersProvider(context));
                  },
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 10, left: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffe7e7e7),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              height: MediaQuery.of(context).size.height * 0.25,
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
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        "Total you owe",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontFamily: CustomTheme.fontFamily,
                                            color: Colors.black),
                                      ),
                                    ),
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
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black26,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: ListView.builder(
                                  itemCount: data?.data.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: OrderListTile(
                                        date: data?.data[index].purchasedDate ??
                                            DateTime.now(),
                                        imgUrl:
                                            data?.data[index].storeImgLink ??
                                                "",
                                        titleText:
                                            data?.data[index].storeName ?? "",
                                        price: data?.data[index].amount ?? 0,
                                        id: data?.data[index].orderId
                                                .toString() ??
                                            "",
                                        status: data?.data[index].status ?? "",
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
              loading: () => const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}




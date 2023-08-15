import 'package:easypay/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/order_list_tile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "BDT 12600.89",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Italian Plate 2"),
              ),
              const Text(
                "Total you owe",
                style: TextStyle(fontSize: 20, fontFamily: "Italian Plate 2"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final orders = ref.watch(ordersProvider(context));
                      return orders.when(
                          data: (data) {
                            return RefreshIndicator(
                              onRefresh: ()async {
                                 ref.refresh(ordersProvider(context));
                              },
                              child: ListView.builder(
                                  itemCount: data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return OrderListTile(
                                      date: "Sun, 1 November",
                                      imgUrl: "assets/icons/rokomari.png",
                                      titleText: "Rokomari",
                                      price: data?[index].totalAmount,
                                    );
                                  }),
                            );
                          },
                          error: (error, stackTrace) =>
                              Center(child: Text('Error: $error')),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()));
                    },
                  ))
            ],
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
import 'package:flutter/material.dart';
import '../widgets/order_list_tile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
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
                Container(
                  height: 500,
                  child: ListView(
                    children: const [
                      OrderListTile(
                        date: "Sun, 6 August",
                        imgUrl: "assets/icons/ajkerdeal.png",
                        titleText: "Ajkerdeal",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OrderListTile(
                        date: "Sun, 20 August",
                        imgUrl: "assets/icons/bagdoom.png",
                        titleText: "Bagdoom",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OrderListTile(
                        date: "Sun, 10 October",
                        imgUrl: "assets/icons/daraz.png",
                        titleText: "Daraz",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OrderListTile(
                        date: "Sun, 1 November",
                        imgUrl: "assets/icons/rokomari.png",
                        titleText: "Rokomari",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

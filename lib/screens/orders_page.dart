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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("BDT 12600.89",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const Text("Total you owe", style: TextStyle(fontSize: 20)),
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
                      OrderListTile(),
                      OrderListTile(),
                      OrderListTile(),
                      OrderListTile()
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

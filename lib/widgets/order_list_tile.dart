import 'package:flutter/material.dart';

import '../screens/single_order_screen.dart';

class OrderListTile extends StatelessWidget {
  final String date;
  final String imgUrl;
  final String titleText;
  final String price;
  const OrderListTile(
      {super.key,
      required this.date,
      required this.imgUrl,
      required this.titleText,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return const SingleOrder();
        }));
      },
      child: ListTile(
        leading: Image.asset(imgUrl),
        title: Text(titleText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: "Italian Plate 2")),
        subtitle: Text(
          date,
          style: const TextStyle(fontFamily: "Italian Plate 2"),
        ),
        trailing: Container(
          decoration: BoxDecoration(
              color: const Color(0xff333333),
              borderRadius: BorderRadius.circular(10)),
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BDT $price",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Color(0xffD2E063))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../screens/single_order_screen.dart';

class OrderListTile extends StatelessWidget {
  final String date;
  final String imgUrl;
  final String titleText;
  const OrderListTile({super.key, required this.date, required this.imgUrl, required this.titleText});

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
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: "Italian Plate 2")),
        subtitle: Text(
          date,
          style: TextStyle(fontFamily: "Italian Plate 2"),
        ),
        trailing: Container(
          decoration: BoxDecoration(
              color: Color(0xff333333),
              borderRadius: BorderRadius.circular(10)),
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BDT 2500",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Color(0xffD2E063))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

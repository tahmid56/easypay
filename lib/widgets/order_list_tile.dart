import 'package:easypay/constants/url.dart';
import 'package:easypay/route/named_routes.dart';
import 'package:easypay/screens/single_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../constants/theme.dart';

class OrderListTile extends StatelessWidget {
  final DateTime date;
  final String imgUrl;
  final String titleText;
  final double? price;
  final String id;
  const OrderListTile(
      {super.key,
      required this.date,
      required this.imgUrl,
      required this.titleText,
      required this.price,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return SingleOrder(id: id);
        }));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 0, right: 5),
        leading: imgUrl == ""
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/logo4.png',
                  height: 20,
                  width: 50,
                ),
              )
            : CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("${Urls.baseUrl}$imgUrl"),
              ),
        title: Text(titleText,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: CustomTheme.fontFamily,
                color: Colors.black)),
        subtitle: Text(
          DateFormat('MMM, dd, yyyy').format(date),
          style: const TextStyle(
              fontFamily: CustomTheme.fontFamily, color: Colors.black),
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
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward, color: Color(0xffD2E063))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

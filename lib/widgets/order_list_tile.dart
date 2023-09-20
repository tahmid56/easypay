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
  final double price;
  final String id;
  final String status;
  const OrderListTile(
      {super.key,
      required this.date,
      required this.imgUrl,
      required this.titleText,
      required this.price,
      required this.id,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return SingleOrder(
              id: id,
              imgUrl: imgUrl,
            );
          }));
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imgUrl == ""
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/logo4.png',
                          height: 20,
                          width: 50,
                        ))
                    : SizedBox(
                        height: 50,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage("${Urls.baseUrl}$imgUrl"),
                        ),
                      ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: CustomTheme.fontFamily,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat('MMM, dd, yyyy').format(date),
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: CustomTheme.fontFamily,
                          color: Colors.black),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                            color: Color(
                                status == "Pending" ? 0xffd0e062 : 0xffb3edf7),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "BDT $price",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        status == "Pending" ? "Ongoing" : "Completed",
                        style: const TextStyle(
                            fontSize: 12, fontFamily: CustomTheme.fontFamily),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// ListTile(
//         contentPadding: const EdgeInsets.only(left: 0, right: 5),
//         leading: imgUrl == ""
//             ? ClipRRect(
//                 borderRadius: BorderRadius.circular(50),
//                 child: Image.asset(
//                   'assets/images/logo4.png',
//                   height: 20,
//                   width: 50,
//                 ),
//               )
//             : CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage("${Urls.baseUrl}$imgUrl"),
//               ),
//         title: Text(titleText,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontFamily: CustomTheme.fontFamily,
//                 color: Colors.black)),
//         subtitle: Text(
//           DateFormat('MMM, dd, yyyy').format(date),
//           style: const TextStyle(
//               fontFamily: CustomTheme.fontFamily, color: Colors.black),
//         ),
//         trailing: Container(
//           decoration: BoxDecoration(
//               color: Color(status == "Pending" ? 0xffd0e062 : 0xffb3edf7),
//               borderRadius: BorderRadius.circular(5)),
//           child: Padding(
//             padding: const EdgeInsets.all(7.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "BDT $price",
//                   style: const TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
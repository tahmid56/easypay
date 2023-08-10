import 'package:flutter/material.dart';

import '../screens/single_order_screen.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return const SingleOrder();
        }));
      },
      child: ListTile(
        leading: Icon(
          Icons.image_not_supported,
          size: 40,
        ),
        title: Text("Lacoste", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Wed, 25 August"),
        trailing: Container(
          decoration: BoxDecoration(
              color: Color(0xff333333),
            borderRadius: BorderRadius.circular(10)
          ),
          width: 130,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BDT 2212.12", style: TextStyle(color: Colors.white),),
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
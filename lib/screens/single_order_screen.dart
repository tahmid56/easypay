import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleOrder extends StatefulWidget {
  const SingleOrder({Key? key}) : super(key: key);

  @override
  State<SingleOrder> createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey, // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Text("10 Oct, 2023",
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Italian Plate 2')),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Lacoste",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Italian Plate 2'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("BDT 10,000",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Italian Plate 2')),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: Divider(
                            height: 25,
                            thickness: 1.5,
                          ),
                        ),
                        Text(
                          "BDT 5,000",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Italian Plate 2'),
                        ),
                        Text(
                          "Remaining",
                          style: TextStyle(
                              fontSize: 15, fontFamily: 'Italian Plate 2'),
                        ),
                      ],
                    ),
                  ),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 3,
                        color: Colors.grey,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 80, child: Image.asset("assets/images/gg.png")),
                    Text(
                      "....4538",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Italian Plate 2'),
                    ),
                    Text(
                      "Change",
                      style: TextStyle(
                          color: Color(0xff00C2E4),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Italian Plate 2'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Container(
                  height: 400,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Container(
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Italian Plate 2'),
                            ),
                          ),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 5,
                                color: Color(0xff00C2E4),
                              )),
                        ),
                        title: Text(
                          "First payment",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Italian Plate 2',
                          ),
                        ),
                        subtitle: const Text("Sun, 6 August",
                            style: TextStyle(
                                fontSize: 13, fontFamily: 'Italian Plate 2')),
                        trailing: const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("BDT 2500",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Italian Plate 2')),
                              Text(
                                "PAID",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Italian Plate 2'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 5,
                              color: const Color(0xff00C2E4),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Italian Plate 2'),
                            ),
                          ),
                        ),
                        title: const Text(
                          "Second payment",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Italian Plate 2'),
                        ),
                        subtitle: const Text("Sun, 20 August",
                            style: TextStyle(
                                fontSize: 13, fontFamily: 'Italian Plate 2')),
                        trailing: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("BDT 2500",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Italian Plate 2')),
                              Text(
                                "PAID",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Italian Plate 2'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Italian Plate 2'),
                            ),
                          ),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 5,
                                color: Colors.pinkAccent,
                              )),
                        ),
                        title: Text("Third payment",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          "Sun, 10 October",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Italian Plate 2',
                          ),
                        ),
                        trailing: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              "Pay BDT 2500",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontFamily: 'Italian Plate 2'),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xff333333),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          child: Center(
                            child: Text(
                              "4",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Italian Plate 2'),
                            ),
                          ),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 5,
                                color: Colors.grey,
                              )),
                        ),
                        title: const Text(
                          "Final payment",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Italian Plate 2'),
                        ),
                        subtitle: Text("Sun, 1 November",
                            style: TextStyle(
                                fontSize: 13, fontFamily: 'Italian Plate 2')),
                        trailing: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text("BDT 2500",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontFamily: 'Italian Plate 2')),
                        ),
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

import 'package:easypay/providers/user_provider.dart';
import 'package:easypay/screens/single_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userRepositoryProvider);
    debugPrint(user?.data.fullName.toString());
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 200,
                child: Image.asset("assets/images/logo4.png"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xffE7E7E7),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              Text(
                "Hello, ${user?.data.fullName}",
                style: const TextStyle(
                    fontSize: 20, fontFamily: "Italian Plate 2"),
              ),
              const SizedBox(height: 15),
              const Text("BDT 12600.89",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Italian Plate 2")),
              const Text("Total you owe",
                  style:
                      TextStyle(fontSize: 20, fontFamily: "Italian Plate 2")),
              const SizedBox(height: 30),
              const Text(
                "Credit Available: BDT 56820.12",
                style: TextStyle(fontSize: 15, fontFamily: "Italian Plate 2"),
              ),
              const Divider(
                height: 80,
                thickness: 2,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "22123",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            fontFamily: "Italian Plate 2"),
                      ),
                      Text("Due in 15 days",
                          style: TextStyle(
                              fontSize: 13, fontFamily: "Italian Plate 2"))
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Text("22123",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontFamily: "Italian Plate 2")),
                      Text("Due in 15 days",
                          style: TextStyle(
                              fontSize: 13, fontFamily: "Italian Plate 2"))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Upcoming payments",
                              style: TextStyle(fontFamily: "Italian Plate 2"),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xffD2E063),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "All Orders",
                            style: TextStyle(fontFamily: "Italian Plate 2"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey)),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          child: Center(
                            child: const Text(
                              "3",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: "Italian Plate 2"),
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
                          "Yellow Shopping",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Italian Plate 2"),
                        ),
                        subtitle: Text(
                          "Wed, 25 August",
                          style:const TextStyle(
                              fontSize: 13, fontFamily: "Italian Plate 2"),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const SingleOrder();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffD2E063),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Pay BDT 2212",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Italian Plate 2"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          child: Center(
                            child: Text(
                              "3",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: "Italian Plate 2"),
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
                          "Yellow Shopping",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Italian Plate 2"),
                        ),
                        subtitle: Text(
                          "Wed, 25 August",
                          style: TextStyle(
                              fontSize: 13, fontFamily: "Italian Plate 2"),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            "BDT 2212",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Italian Plate 2",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({super.key});

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  List<String> imgUrl = [
    "https://easypayltd.com/slider1.jpg",
    "https://easypayltd.com/slider3.jpg",
    "https://easypayltd.com/slider4.jpg",
    "https://easypayltd.com/slider8.jpg",
    "https://easypayltd.com/slider6.jpg",
    "https://easypayltd.com/slider5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Shop",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Italian Plate 2"),
            ),
            const Text(
              "with easypay",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Italian Plate 2"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://easypayltd.com/slider2.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber,
                    ),
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    height: 200,
                    alignment: Alignment.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://easypayltd.com/slider7.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    height: 200,
                    alignment: Alignment.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://easypayltd.com/slider3.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber,
                    ),
                    margin: const EdgeInsets.all(5),
                    width: 150,
                    height: 200,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                height: 40,
                child: ListView(
                  itemExtent: 100,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "all",
                            style: TextStyle(fontFamily: "Italian Plate 2"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "men's",
                            style: TextStyle(fontFamily: "Italian Plate 2"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xfff13a5c),
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "women's",
                          style: TextStyle(
                              fontFamily: "Italian Plate 2",
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "beauty",
                          style: TextStyle(fontFamily: "Italian Plate 2"),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "apparel",
                          style: TextStyle(fontFamily: "Italian Plate 2"),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          "accessories",
                          style: TextStyle(fontFamily: "Italian Plate 2"),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  mainAxisSpacing: 10.0, // Spacing between rows
                  crossAxisSpacing: 10.0, // Spacing between columns
                ),
                itemCount: 6, // Number of items in the grid
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          imgUrl[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber,
                    ),
                    margin: const EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

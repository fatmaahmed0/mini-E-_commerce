// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:product_app/home.dart';
import 'package:product_app/single_product.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: const Color.fromARGB(255, 240, 169, 63),
                  currentIndex: index,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.store), label: "Store"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: "Settings"),
                  ],
                  onTap: (val) {
                    setState(() {
                      index = val;
                    });
                  },
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      search_bar(),
                      SizedBox(
                        height: 25,
                      ),
                      CustomText(text: "Categories"),
                      iconcategories(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(text: "Best Salling"),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    mainAxisExtent: 200),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SingleProduct(
                                          product: products[index]),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        products[index]['img'],
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                        height: 100,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(products[index]['title'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 5),
                                      Text(products[index]['des'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey)),
                                      SizedBox(height: 5),
                                      Text(products[index]['price'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 230, 155, 17))),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ))));
  }

  Container iconcategories() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cats.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: cats[index]['active']
                            ? Colors.orange
                            : const Color.fromARGB(255, 175, 184, 189),
                        radius: 30,
                        child: Icon(cats[index]['icon'],
                            size: 30,
                            color: cats[index]['active']
                                ? Colors.white
                                : Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(cats[index]['txt']),
                    ],
                  ),
                ),
              );
            }));
  }

  TextField search_bar() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefix: Icon(
            Icons.search,
            size: 25,
            color: Colors.black,
          ),
          hintText: "Search",
          suffix: Icon(
            Icons.segment,
            size: 30,
            color: Colors.black,
          )),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
    );
  }
}

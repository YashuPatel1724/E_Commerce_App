import 'dart:async';
import 'dart:ui';

import 'package:e_commerce_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(color: Color(0xff7B8A8B), fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        for(int i=0; i<cartList.length; i++)
                          {
                                Navigator.of(context).pushNamed('/cart');
                          }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff3C5A5D),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.shopping_cart,color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xff3C5A5D),
                    size: 30,
                  ),
                  Text(
                    'New York, USA',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 52,
                    width: 253,
                    decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.search,
                            size: 25,
                          ),
                          Text(
                            '  Search Furniture',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                  ), //search
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        color: const Color(0xff3C5A5D),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 28,
                    ),
                  ), //menu
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(13)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'New Collection',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Discount 50% for\nthe first transaction',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 32,
                            width: 110,
                            decoration: BoxDecoration(
                              color: const Color(0xff3C5A5D),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 110,
                          width: 110,
                          child: Image.asset(
                              'Assets/images/1-removebg-preview (1).png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ), //new collection
              const Text(
                '. . . . .',
                style: TextStyle(
                    height: -0.01, color: Color(0xff3C5A5D), fontSize: 50),
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Color(0xff3C5A5D), fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                  l1.length,
                  (index) =>
                      category(index, l1[index]['image'], l1[index]['name']),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Flash Sale',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Wrap(
                children: List.generate(
                    6,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          selectionIndex = index;
                        });
                        Navigator.of(context).pushNamed('/detail');
                      },
                      child: product(
                          image: productList[index]['image'],
                          name: productList[index]['name'],
                          price: productList[index]['price']),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container product({required String image, required String name, required int price}) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 200,
      width: 145,
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            color: const Color(0xffF6F6F6),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(image,fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Rs.$price",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.yellow,
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Text('4.5'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget category(int index, String image, String name) {
    return Column(
      children: [
        Container(
          margin: (index == 0) ? null : const EdgeInsets.only(left: 20),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: const Color(0xffF1F3F3),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              l1[index]['image'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          l1[index]['name'],
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

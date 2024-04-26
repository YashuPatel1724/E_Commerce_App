import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/utils.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    deliveryfee=500;
    dicount=250;
    for (int i = 0; i < cartList.length; i++) {
      // qty = (qty + cartList[i]['qty']).toInt();
      subtotal = (subtotal + cartList[i]['price']*cartList[i]['qty']).toInt();
    }
    total = (subtotal+deliveryfee-dicount).toInt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/home');
                    total = 0;
                    subtotal=0;
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black38, width: 0.5)),
                    child: Icon(CupertinoIcons.arrow_left),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 82.0),
                  child: Text(
                    'My Cart',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      cartList.length,
                      (index) => Container(
                        height: 120,
                        // width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: BorderDirectional(
                                bottom: BorderSide(color: Colors.black))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                cartList[index]['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Column(
                                children: [
                                  Text(
                                    cartList[index]['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 65),
                                    child: Text(
                                      'Chair',
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: Text(
                                      cartList[index]['price'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if(cartList.length==1)
                                    {
                                      setState(() {
                                        dicount=0;
                                        deliveryfee=0;
                                        total=0;
                                        subtotal=0;
                                      });
                                    }

                                    else
                                    {
                                      setState(() {
                                        subtotal = (subtotal - cartList[index]['price']).toInt();
                                        total = (subtotal-deliveryfee-dicount).toInt();
                                      });
                                    }
                                    setState(() {
                                      // cartList[index]['qty'] = 1;
                                      cartList.removeAt(index);
                                    });

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 55),
                                    child: Icon(
                                      Icons.delete_forever_rounded,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 45.0, left: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // total = (deliveryfee - dicount - cartList[index]['price']).toInt();
                                          setState(() {
                                            if (cartList[index]['qty'] > 1) {
                                              cartList[index]['qty']--;
                                              subtotal=(subtotal-cartList[index]['price']).toInt();
                                              total = (subtotal-deliveryfee-dicount).toInt();
                                            }
                                            // total = (subtotal+deliveryfee-dicount).toInt();
                                          });

                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF6F6F6),
                                          ),
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${cartList[index]['qty']}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          total = (subtotal+deliveryfee + dicount + cartList[index]['price']).toInt();
                                          setState(() {
                                            // list[index]['qty']++;
                                             cartList[index]['qty']++;
                                                 subtotal=(subtotal+cartList[index]['price']).toInt();
                                                 total = (subtotal+deliveryfee-dicount).toInt();
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10),
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            color: Color(0xff3C5A5D),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 13),
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Text(
                                'Promo Code',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 17),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                'Apply',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub_Total',
                          style: TextStyle(color: Colors.black26, fontSize: 18),
                        ),
                        Text(
                          '$subtotal',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: TextStyle(color: Colors.black26, fontSize: 18),
                        ),
                        Text(
                          '$deliveryfee',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Disount',
                          style: TextStyle(color: Colors.black26, fontSize: 18),
                        ),
                        Text(
                          '$dicount',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Cost',
                          style: TextStyle(color: Colors.black26, fontSize: 18),
                        ),
                        Text(
                          '$total',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    InkWell(
                      onTap:() {
                        Navigator.of(context).pushNamed('/check');
                      },
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xff3C5A5D),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Proceed to Check',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int count = 1;

int total = 0;
int subtotal = 0;
int dicount = 500;
int deliveryfee = 250;
int qty = 0;



// Container(
//   height: 100,
//   width: double.infinity,
//   decoration: BoxDecoration(
//     color: Colors.black,
//     borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
//   ),
//   alignment: Alignment.center,
//   child: Text('Total : Rs. ${total}',style: TextStyle(color: Colors.white,fontSize: 25),),
// ),



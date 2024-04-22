import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'Assets/images/1673491556_pro-dachnikov-com-p-sinie-kresla-v-gostinoi-foto-1.jpg'),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black38,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,bottom:80),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'HOME ',
                    style: TextStyle(
                        color: Color(0xff98C7D7),
                        fontWeight: FontWeight.w400,
                        fontSize: 40),
                  ),
                  TextSpan(
                      text: 'Heaven\n',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w500),),
                  TextSpan(
                      text: 'Furnishings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,letterSpacing: 8))
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}

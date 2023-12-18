import 'package:flutter/material.dart';

import '../product/util.dart';

class Cartbutton extends StatefulWidget {
  const Cartbutton({super.key});

  @override
  State<Cartbutton> createState() => _CartbuttonState();
}

class _CartbuttonState extends State<Cartbutton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "Cart");
            cartlist.isEmpty ? Colors.transparent : Colors.amber;
            setState(() {});
          },
          icon: Icon(
            Icons.shopping_bag,
            color: Colors.white,
            size: MediaQuery.devicePixelRatioOf(context) * 10.3,
          ),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Positioned(
            right: MediaQuery.devicePixelRatioOf(context) * 2,
            bottom: MediaQuery.devicePixelRatioOf(context) * 9,
            child: CircleAvatar(
              backgroundColor:
                  cartlist.isEmpty ? Colors.transparent : Colors.amber,
              radius: MediaQuery.devicePixelRatioOf(context) * 3.6,
              child: Center(
                  child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "${cartlist.length}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.devicePixelRatioOf(context) * 5.5,
                      color: cartlist.length == 0
                          ? Colors.transparent
                          : Colors.black),
                ),
              )),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zomato/buttons/back.dart';
import 'package:zomato/cart/empty.dart';
import 'package:zomato/cart/full.dart';
import 'package:zomato/product/util.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D1D),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1D1D),
        leading:const Back(),
        title: const Text(
          "Payment",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            cartlist.isEmpty ? const Empty() :Full(),
          ],
        ),
      ),
    );
  }
}

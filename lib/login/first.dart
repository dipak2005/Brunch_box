import 'package:flutter/material.dart';

import 'package:zomato/login/second.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D1D),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.devicePixelRatioOf(context)*20.7,
            ),
            Center(child: Image.asset("assets/cuate.png")),
            SizedBox(
              height: MediaQuery.devicePixelRatioOf(context)*10.4,
            ),
            Second(),
          ],
        ),
      ),
    );
  }
}

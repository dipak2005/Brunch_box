import 'package:flutter/material.dart';
import 'package:zomato/buttons/back.dart';

class Feedbackpage extends StatelessWidget {
  const Feedbackpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D1D),
      appBar: AppBar(
        backgroundColor: Color(0xff1E1D1D),
        leading: Back(),
        title: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "Customer Feedback",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.devicePixelRatioOf(context) * 7.7),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset("assets/72.png"),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          Center(
            child: Image.asset("assets/frame1.png"),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          Center(
            child: Image.asset("assets/Frame2.png"),
          ),
        ],
      ),
    );
  }
}

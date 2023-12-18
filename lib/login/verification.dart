

import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(
            child: Text(
              "We have sent  a verification code to",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Didn't receive the code?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: "  Resend now",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

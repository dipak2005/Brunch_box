import 'package:flutter/material.dart';

import '../buttons/account.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D1D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/c.png"),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "Healthy Recipies",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.devicePixelRatioOf(context) * 6.3,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          Text(
            "Maintaining good health should  be the ",
            style: TextStyle(
                color: Colors.white,
                // letterSpacing: 1,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.devicePixelRatioOf(context) * 4.5),
          ),
          Text(
            "primary focus of everyone",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.devicePixelRatioOf(context) * 4.5),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.016,
                width: MediaQuery.sizeOf(context).width * 0.04,
                decoration: BoxDecoration(
                    color: Colors.amber.shade600,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.02,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.016,
                width: MediaQuery.sizeOf(context).width * 0.07,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.01,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          Account(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          TextButton(
            onPressed: () {},
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Already Have An Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.devicePixelRatioOf(context) * 4.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: " Log in",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 4.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../buttons/start.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01e1d1d),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/e.png",
            ),
          ),
          const FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "Eat Healthy",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "Maintaining good health should  be the ",
              style: TextStyle(
                  color: Colors.white,
                  // letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  fontSize: 15),
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              "primary focus of everyone",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.016,
                width: MediaQuery.sizeOf(context).width * 0.07,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.02,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.016,
                width: MediaQuery.sizeOf(context).width * 0.04,
                decoration: BoxDecoration(
                    color: Colors.amber.shade600,
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
          Start(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.04,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "First");
            },
            child: FittedBox(
              fit: BoxFit.cover,
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
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.05,
          ),
          Align(
              alignment: Alignment(0.7, 0),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "Created by",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset("assets/sign.png",
                  height: MediaQuery.sizeOf(context).height * 0.05)),
          Align(
              alignment: Alignment(0.7, 0),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "RWR2",
                  style: TextStyle(
                    color: Color(0xffFDBD00),
                    fontSize: MediaQuery.sizeOf(context).width * 0.04,
                  ),
                ),
              )),

        ],
      ),
    );
  }
}

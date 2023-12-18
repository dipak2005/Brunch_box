import 'package:flutter/material.dart';

class Emailbutton extends StatefulWidget {
  const Emailbutton({super.key});

  @override
  State<Emailbutton> createState() => _EmailbuttonState();
}

class _EmailbuttonState extends State<Emailbutton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
              Size(
                MediaQuery.sizeOf(context).width * 0.87,
                MediaQuery.sizeOf(context).height * 0.07,
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/g.png",
                fit: BoxFit.cover,
                height: 40,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  " Sign up with Google",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.devicePixelRatioOf(context) * 4.5),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

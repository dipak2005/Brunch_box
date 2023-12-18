import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          Color(0xffFDBD00),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width * 0.8,
              MediaQuery.sizeOf(context).height * 0.05),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, "Splash2");
      },
      child: Text(
        "Get Started ",
        style: GoogleFonts.abhayaLibre(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: MediaQuery.devicePixelRatioOf(context)*6.6,
            letterSpacing: 1),
      ),
    );
  }
}

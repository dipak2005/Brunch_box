import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
        Navigator.pushNamed(context, "First");

      },
      child: Text(
        "Get Accounted ",
        style: GoogleFonts.abhayaLibre(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
            letterSpacing: 1),
      ),
    );
  }
}

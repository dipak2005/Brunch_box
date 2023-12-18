import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            Color(0xff303030),
          ),
          fixedSize: MaterialStatePropertyAll(Size(
              MediaQuery.sizeOf(context).width * 0.86,
              MediaQuery.sizeOf(context).height * 0.06))),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0xff1E1D1D),
              content: Image.asset("assets/done.png"),
              title: Text(
                " Payment Successfully ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.devicePixelRatioOf(context) * 8.7),
              ),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Payment",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Icon(
            (Icons.arrow_right_outlined),
            color: Colors.amber,
            size: 40,
          )
        ],
      ),
    );
  }
}

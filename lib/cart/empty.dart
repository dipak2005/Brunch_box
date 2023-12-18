import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  const Empty({super.key});

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.8,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Image.asset(
            "assets/cart1.png",
            fit: BoxFit.cover,
          ),
          const Text(
            "your Cart is Empty !",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const Text(
            "Add Items to  It Now",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll(Size(250, 50)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: const MaterialStatePropertyAll(Colors.amber),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "Totallist");
            },
            child: const Text(
              "Shop Now",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

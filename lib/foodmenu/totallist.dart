import 'package:flutter/material.dart';
import 'package:zomato/buttons/back.dart';
import 'package:zomato/buttons/cartbutton.dart';
import 'package:zomato/product/list.dart';
import 'package:zomato/product/model.dart';

import '../product/util.dart';

class Totallist extends StatefulWidget {
  const Totallist({super.key});

  @override
  State<Totallist> createState() => _TotallistState();
}

class _TotallistState extends State<Totallist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1D1D),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.04,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                "Food Menu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.devicePixelRatioOf(context) * 7.5,
                    fontWeight: FontWeight.w700),
              ),
            ),

            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.87,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: routelist.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> rl = routelist[index];
                  Product pm = Product.frommap(rl);
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        pm.routename ?? "",
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff1E1500),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(pm.image ?? ""),
                         
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "${pm.name ?? ""} ->",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

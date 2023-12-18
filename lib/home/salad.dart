import 'package:flutter/material.dart';
import 'package:zomato/product/saladutil.dart';

import '../product/model.dart';

class Salad extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Salad({Key? key, this.map}) : super(key: key);

  @override
  State<Salad> createState() => _SaladState();
}

class _SaladState extends State<Salad> {
  Map<String, dynamic>? map;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.24,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: saladlist.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> sl = saladlist[index];
                Product pm = Product.frommap(sl);
                map = sl;
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "Detailpage", arguments: sl);
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        decoration: BoxDecoration(
                            color: const Color(0xff1E1500),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "${pm.image}",
                              height: MediaQuery.sizeOf(context).height * 0.14,
                              width: MediaQuery.sizeOf(context).width * 0.8,
                            ),
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                pm.name ?? "",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.01,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: MediaQuery.devicePixelRatioOf(context) *
                                      5.9,
                                ),
                                FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    " ${pm.rating ?? ""}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    "        \u20B9${pm.price ?? ""}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.devicePixelRatioOf(context) * 3,
                        left: MediaQuery.devicePixelRatioOf(context) * 3,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.037,
                          width: MediaQuery.sizeOf(context).width * 0.13,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                              child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "${pm.discount ?? 0}%",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "More Recipies",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.devicePixelRatioOf(context) * 60.6,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Saladrecipe");
                },
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.13,
            child: ListView.builder(
              itemCount: saladlist.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> fr = saladlist[index];
                Product pm = Product.frommap(fr);
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "Foodrecipe", arguments: fr);
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: Alignment(-0.7, 0),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.08,
                            width: MediaQuery.sizeOf(context).width * 0.23,
                            decoration: BoxDecoration(
                              color: Color(0xff303030),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset("${pm.image}"),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                " ${pm.name} Recipe",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: MediaQuery.devicePixelRatioOf(context) *
                                      7.9,
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    " ${pm.rating}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment(-0.5, 0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "2.2 km",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            "   Rs.${pm.price}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

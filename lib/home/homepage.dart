import 'package:flutter/material.dart';
import 'package:zomato/buttons/cartbutton.dart';
import 'package:zomato/home/food.dart';
import 'package:zomato/home/fruite.dart';
import 'package:zomato/recipemenu/menulist.dart';

import 'package:zomato/home/salad.dart';

import '../product/util.dart';

class Homepage extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Homepage({Key? key, this.map}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

int page = 0;

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D1D),
      appBar: AppBar(
        clipBehavior: Clip.antiAlias,
        backgroundColor: Color(0xff1E1D1D),
        leading: Image.asset(
          "assets/b.png",
          height: MediaQuery.sizeOf(context).height * 0.02,
          width: MediaQuery.sizeOf(context).width * 0.02,
        ),
        title: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "Welcome to BrunchBox",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 23),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "Camera");
            },
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, "Search"),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.07,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xff474747),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.devicePixelRatioOf(context) * 4.4,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.red,
                      size: 30,
                    ),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        "  Search Your Favorite Dishes ...",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.devicePixelRatioOf(context) * 4.5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: MediaQuery.sizeOf(context).width * 0.9,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Image.asset(
              "assets/Frame25.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.020,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.04,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      healthy = true;
                      salad = false;
                      fruite = false;
                      page = 0;
                    });
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    decoration: BoxDecoration(
                      color: healthy ? Color(0xffFDBD00) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          width: MediaQuery.sizeOf(context).width * 0.09,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/food.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Healthy Food ",
                            style: TextStyle(
                                color: !healthy ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.devicePixelRatioOf(context) * 5.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      healthy = false;
                      salad = true;
                      fruite = false;
                      page = 1;
                    });
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    decoration: BoxDecoration(
                      color: salad ? Color(0xffFDBD00) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          width: MediaQuery.sizeOf(context).width * 0.09,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/salad.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        FittedBox(
                           fit: BoxFit.cover,
                          child: Text(
                            "Salad Food",
                            style: TextStyle(
                                color: !salad ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.devicePixelRatioOf(context) * 5.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      healthy = false;
                      salad = false;
                      fruite = true;
                      page = 2;
                    });
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    decoration: BoxDecoration(
                      color: fruite ? Color(0xffFDBD00) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          width: MediaQuery.sizeOf(context).width * 0.09,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/fruite.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            "Fruites",
                            style: TextStyle(
                                color: !fruite ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.devicePixelRatioOf(context) * 5.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.04,
                ),
              ],
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "More Dishes",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                width: MediaQuery.devicePixelRatioOf(context) * 60.6,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Totallist");
                  },
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 15),
                    ),
                  )),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: page,
              children: [
                Food(),
                Salad(),
                Fruite(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

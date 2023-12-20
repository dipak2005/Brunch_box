import 'package:flutter/material.dart';
import 'package:zomato/buttons/back.dart';
import 'package:zomato/buttons/cartbutton.dart';
import 'package:zomato/product/mpsearchlist.dart';

import '../product/model.dart';
import '../product/util.dart';

class Mp extends StatefulWidget {
  const Mp({super.key});

  @override
  State<Mp> createState() => _MpState();
}

class _MpState extends State<Mp> {
  TextEditingController searchcontroller = TextEditingController();
  int search = 10;
  List<Map<String, dynamic>> foundproduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundproduct = mplist;
  }

  void runfilter(String enterkey) {
    List<Map<String, dynamic>> result = [];
    if (enterkey.isEmpty) {
      result = mplist;
    } else {
      result = mplist
          .where((element) =>
              element["name"].toString().contains(enterkey.toString()))
          .toList();
    }
    setState(() {
      foundproduct = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                "Mp Dishes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.devicePixelRatioOf(context) * 7.5,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.devicePixelRatioOf(context) * 2.8),
              child: SearchBar(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xff474747),
                ),
                hintText: "Search Dishes Enjoy Dishies",
                hintStyle: MaterialStatePropertyAll(
                  TextStyle(color: Colors.white),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                leading: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30,
                ),
                onChanged: (value) {
                  runfilter(value);
                },
                trailing: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: foundproduct.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> pl = foundproduct[index];
                  Product pm = Product.frommap(pl);
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "Detailpage",
                              arguments: pl);
                        },
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.27,
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          decoration: BoxDecoration(
                              color: Color(0xff1E1500),
                              borderRadius: BorderRadius.circular(20)),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                pm.image ?? "",
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  pm.name ?? "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  " \u20B9${pm.price ?? ""}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          MediaQuery.devicePixelRatioOf(context) *
                                              5.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.devicePixelRatioOf(context) * 3,
                        right: MediaQuery.devicePixelRatioOf(context) * 3,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              cartlist.add(pl);
                            });
                          },
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.036,
                            width: MediaQuery.sizeOf(context).width * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cartlist.add(pl);
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.deepOrange,
                                size: MediaQuery.devicePixelRatioOf(context) *
                                    5.9,
                                fill: 0.6,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

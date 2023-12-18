import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zomato/buttons/back.dart';
import 'package:zomato/buttons/cartbutton.dart';

import '../product/util.dart';

class Detailpage extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Detailpage({Key? key, this.map}) : super(key: key);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int product = 1;
  num finalprice = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    widget.map = arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1D1D),
      appBar: AppBar(
        backgroundColor: Color(0xff1E1D1D),
        leading:Back(),
        actions:  [
          Cartbutton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.04,
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.24,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1500),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("${widget.map?["image"] ?? ""}"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        cartlist.add(widget.map!);
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
                            cartlist.add(widget.map!);
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.deepOrange,
                          size: MediaQuery.devicePixelRatioOf(context) * 5.9,
                          fill: 0.6,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.devicePixelRatioOf(context) * 10.7,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.56,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Color(0xff8D6C0E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          decoration: BoxDecoration(
                            color: Color(0xff303030),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: MediaQuery.devicePixelRatioOf(context) *
                                    8.5,
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  " ${widget.map?["rating"] ?? ""}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.devicePixelRatioOf(context) *
                                            6.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                var product = this.product;
                                setState(() {
                                  widget.map?["product"]++;
                                });
                              },
                              icon: Icon(
                                Icons.add_circle,
                                size: MediaQuery.devicePixelRatioOf(context) *
                                    9.5,
                                color: Colors.amber,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                "${widget.map?["product".toString()] ?? 0}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                       17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (widget.map?["product"] == 1) {
                                    cartlist.remove(widget.map!);
                                    Navigator.pop(context);
                                  }
                                  widget.map?["product"]--;
                                });
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                size: MediaQuery.devicePixelRatioOf(context) *
                                    9.5,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        "Name : ${widget.map?["name"] ?? ""}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.devicePixelRatioOf(context) * 7.5,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.devicePixelRatioOf(context) * 5.6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBarIndicator(
                          itemCount: 5,
                          itemSize: 28,
                          direction: Axis.horizontal,
                          rating: double.parse("${widget.map?["rating"] ?? 0}"),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Discount : ${widget.map?["discount"] ?? ""}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.devicePixelRatioOf(context) * 6.7,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.devicePixelRatioOf(context) * 5.6,
                    ),
                    Text(
                      "This is perfect for the appetizer or which is",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 5.5,
                      ),
                    ),
                    Text(
                      "health benefits.its diverse flavors and use of",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize:
                              MediaQuery.devicePixelRatioOf(context) * 5.5),
                    ),
                    Text(
                      "nutritious ingrendients  like  lentils and",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.devicePixelRatioOf(context) * 5.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      "due to its emphasis on balance and freshness",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 5.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          fixedSize: MaterialStatePropertyAll(
                            Size(MediaQuery.sizeOf(context).height * 0.4,
                                MediaQuery.sizeOf(context).width * 0.1),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber)),
                      onPressed: () {
                        print(".....>${widget.map}");
                        cartlist.add(widget.map!);
                        setState(() {
                          Timer(Duration(seconds: 2), () {
                            Navigator.pushNamed(context, "Cart");
                          });
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Add To Cart",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.devicePixelRatioOf(context) *
                                        5.5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.devicePixelRatioOf(context) * 3.5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              fixedSize: MaterialStatePropertyAll(
                                Size(MediaQuery.sizeOf(context).height * 0.2,
                                    MediaQuery.sizeOf(context).width * 0.14),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.amber)),
                          onPressed: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Total price",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.devicePixelRatioOf(context) *
                                            4.5),
                              ),
                              Text(
                                " \u20B9${widget.map?["price"] ?? ""}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      MediaQuery.devicePixelRatioOf(context) *
                                          4.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.03,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              fixedSize: MaterialStatePropertyAll(
                                Size(MediaQuery.sizeOf(context).height * 0.2,
                                    MediaQuery.sizeOf(context).width * 0.14),
                              ),
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff303030))),
                          onPressed: () {
                            Navigator.pushNamed(context, "Cart");
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.amber,
                                size: 30,
                              ),
                              Text(
                                "Go to Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        MediaQuery.devicePixelRatioOf(context) *
                                            4.9),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

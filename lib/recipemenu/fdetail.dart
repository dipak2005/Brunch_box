import 'package:flutter/material.dart';
import 'package:zomato/buttons/back.dart';

class Foodrecipe extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Foodrecipe({Key? key, this.map}) : super(key: key);

  @override
  State<Foodrecipe> createState() => _FoodrecipeState();
}

class _FoodrecipeState extends State<Foodrecipe> {
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
      backgroundColor: const Color(0xff1E1D1D),
      appBar: AppBar(
        leading: Back(),
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "${widget.map?["name"]} Recipe",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: MediaQuery.devicePixelRatioOf(context) * 6.7),
          ),
        ),
        backgroundColor: Color(0xff1E1D1D),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.24,
              width: MediaQuery.sizeOf(context).width * 0.5,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Color(0xff1E1500),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset("${widget.map?["image"] ?? ""}"),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.9,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xff8D6C0E),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(20),
                    left: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Align(
                        alignment: Alignment(-0.7, 0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          alignment: Alignment(-0.7, 0),
                          child: Text(
                            "Recipe:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.devicePixelRatioOf(context) *
                                        5.6,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Text(
                        "${widget.map?["recipe"]??""}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 16.5,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zomato/buttons/back.dart';
import 'package:zomato/product/model.dart';
import 'package:zomato/recipeutil/foodutil.dart';

class Frrecipe extends StatefulWidget {
  const Frrecipe({super.key});

  @override
  State<Frrecipe> createState() => _FrrecipeState();
}

class _FrrecipeState extends State<Frrecipe> {
  TextEditingController searchcontroller = TextEditingController();
  int search = 10;
  List<Map<String, dynamic>> foundproduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundproduct = frlist;
  }

  void runfilter(String enterkey) {
    List<Map<String, dynamic>> result = [];
    if (enterkey.isEmpty) {
      result = frlist;
    } else {
      result = frlist
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
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1D1D),
        leading: Back(),
        title: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "Healthy Food Recipies",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).textScaleFactor * 24.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff1E1D1D),
      body: Column(
        children: [
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
            child: ListView.builder(
              itemCount: foundproduct.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> fr = foundproduct[index];
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
                                    fontSize:
                                       15,
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
          )
        ],
      ),
    );
  }
}

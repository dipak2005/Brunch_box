import 'package:flutter/material.dart';
import 'package:zomato/product/list.dart';

import '../product/model.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchcontroller = TextEditingController();
  int search = 10;
  List<Map<String, dynamic>> foundproduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundproduct = routelist;
  }

  void runfilter(String enterkey) {
    List<Map<String, dynamic>> result = [];
    if (enterkey.isEmpty) {
      result = routelist;
    } else {
      result = routelist
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
              height: MediaQuery.sizeOf(context).height * 0.87,
              child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: foundproduct.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> rl = foundproduct[index];
                  Product pm = Product.frommap(rl);
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, pm.routename ?? "");
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
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          Text(
                            "${pm.name ?? ""} ->",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
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

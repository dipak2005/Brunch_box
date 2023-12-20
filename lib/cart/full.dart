import 'package:flutter/material.dart';

import 'package:zomato/cart/bill.dart';
import 'package:zomato/product/model.dart';

import '../product/util.dart';

class Full extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Full({Key? key, this.map}) : super(key: key);

  @override
  State<Full> createState() => _FullState();
}

class _FullState extends State<Full> {
  num finalprice = 0;
  num subtotal = 0;
  num totalprice = 0;
  num total = 0;
  List<num> individualFinalPrices = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    for (var element in cartlist) {
      var q = (element["product"] ?? 0);
      num p1 = num.parse("${q!}");
      var p = (element["price"] ?? 0);
      num pro = num.parse("${p!}");
      var d = (element["discount"] ?? 0);
      num del = num.parse("${d!}");
      num fp = (pro * ((del) / 100));
      finalprice = pro - fp * p1;
      individualFinalPrices.add(pro - fp);
    }
    print(individualFinalPrices);
    setState(() {
      finalprice = individualFinalPrices.fold(0, (sum, price) => sum + price);
    });
    print(finalprice);
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            child: ListView.builder(
              itemCount: cartlist.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> cl = cartlist[index];
                Product pm = Product.frommap(cl);

                return Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  width: MediaQuery.sizeOf(context).width * 0.97,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30)),
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          pm.image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              pm.name ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                  MediaQuery.devicePixelRatioOf(context) *
                                      5.6),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "\u20B9${pm.price ?? ""}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              " Quantity: ${pm.product}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              " Final Price : ${individualFinalPrices[index] * (pm.product ?? 1)}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                //  var product = this.product;
                                  // setState(() {
                                  //   widget.map?["product"]++;
                                  // });

                                  cl["product"] = (pm.product ?? 0) + 1;
                                  print(pm.product);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                  size: MediaQuery.devicePixelRatioOf(context) *
                                      9.5,
                                  color: Colors.orange,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  "${pm.product}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (pm.product == 0) {
                                      cartlist.remove(widget.map);
                                    }
                                    pm.product = (pm.product ?? 0) - 1;
                                    print(pm.product);
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  size: MediaQuery.devicePixelRatioOf(context) *
                                      9.5,
                                  color: Colors.orange,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: const Color(0xff1E1D1D),
                                        title: const Text(
                                          "Remove Item",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.devicePixelRatioOf(
                                                  context) *
                                                  10),
                                        ),
                                        content: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Text(
                                            "Are You Sure You Want to remove this item?",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize:
                                                MediaQuery.devicePixelRatioOf(
                                                    context) *
                                                    5.5),
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.white),
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const FittedBox(
                                              fit: BoxFit.cover,
                                              child: Text(
                                                "CANCEL",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.amber),
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (cartlist.length == 1) {
                                                  cartlist.removeAt(index);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  setState(() {});
                                                }
                                                cartlist.removeAt(index);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: const FittedBox(
                                              fit: BoxFit.cover,
                                              child: Text(
                                                "REMOVE",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.delete,
                                        color: Colors.red,
                                        size: MediaQuery.sizeOf(context).width *
                                            0.07),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Bill(map: widget.map ?? {}),
        ],
      );
  }
}

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
      var p = (element["price"] ?? 0);
      num pro = num.parse("${p!}");
      var d = (element["discount"] ?? 0);
      num del = num.parse("${d!}");
      num fp = (pro * ((del) / 100));
      finalprice = pro - fp;
      individualFinalPrices.add(pro - fp);

    }
    setState(() {
      finalprice = individualFinalPrices.fold(0, (sum, price) => sum + price);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: ListView.builder(
            itemCount: cartlist.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> cl = cartlist[index];
              Product pm = Product.frommap(cl);

              return Container(
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width * 0.97,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30)),
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            " Final Price : ${individualFinalPrices[index]}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
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
                                    MediaQuery.devicePixelRatioOf(context) *
                                        10),
                              ),
                              content: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  "Are You Sure You Want to remove this item?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: MediaQuery.devicePixelRatioOf(
                                              context) *
                                          5.5),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(Colors.white),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
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
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(Colors.amber),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (cartlist.length == 1) {
                                        setState(() {
                                          cartlist.removeAt(index);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        });
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
                      child: Icon(Icons.delete,
                          color: Colors.red,
                          size: MediaQuery.sizeOf(context).width * 0.07),
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

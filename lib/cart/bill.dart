import 'package:flutter/material.dart';
import 'package:zomato/buttons/payment.dart';
import 'package:zomato/product/util.dart';

class Bill extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Bill({Key? key, required this.map}) : super(key: key);

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  num delivery = 0;
  num subtotal = 0;
  num totalprice = 0;
  num total = 0;
  num finalprice = 0;
  int product = 1;
  num discount = 0;
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

      var dd = (element["delivery"] ?? 0);
      num ddd = num.parse("${dd!}");
      num dp = ddd * (element["product"] ?? 1);
      delivery = delivery + dp;

      num sbt = (pro - fp) * (element["product"] ?? 0);
      subtotal = subtotal + sbt;

      var de = (element["discount"] ?? 0);
      num ds = num.parse("${de!}");
      num des = ds * (element["product"] ?? 1);
      discount = discount + des;

    }

    num calculatedTotal = delivery + subtotal;
    setState(() {
      finalprice = individualFinalPrices.fold(0, (sum, price) => sum + price);
      total = calculatedTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.38,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: Color(0xff8D6C0E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "Total Discount",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "$discount%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38, bottom: 15),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "\u20B9.$delivery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38, bottom: 15),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "Subtotal",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "\u20B9.$subtotal",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.white,
            indent: MediaQuery.sizeOf(context).height * 0.035,
            endIndent: MediaQuery.sizeOf(context).height * 0.035,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38, bottom: 15),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "Total",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "\u20B9.$total",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.devicePixelRatioOf(context) * 6.6,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          const Payment(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zomato/detail/detailpage.dart';
import 'package:zomato/foodmenu/fruite.dart';
import 'package:zomato/foodmenu/gujarati.dart';
import 'package:zomato/foodmenu/healthyfood.dart';
import 'package:zomato/foodmenu/mp.dart';
import 'package:zomato/foodmenu/north.dart';
import 'package:zomato/foodmenu/rajfood.dart';
import 'package:zomato/foodmenu/salad.dart';
import 'package:zomato/foodmenu/south.dart';
import 'package:zomato/foodmenu/totallist.dart';
import 'package:zomato/home/camera.dart';
import 'package:zomato/recipemenu/feedback.dart';
import 'package:zomato/recipemenu/frrecipe.dart';
import 'package:zomato/recipemenu/fdetail.dart';
import 'package:zomato/home/homepage.dart';
import 'package:zomato/home/search.dart';
import 'package:zomato/login/first.dart';
import 'package:zomato/login/second.dart';
import 'package:zomato/recipemenu/fruiterecipe.dart';
import 'package:zomato/recipemenu/saladrecipe.dart';
import 'package:zomato/splash/splash.dart';
import 'package:zomato/login/verification.dart';
import 'package:zomato/splash/splash1.dart';
import 'package:zomato/splash/splash2.dart';

import 'cart/cart.dart';
import 'foodmenu/punjabi.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: "/",
      routes: {
        "/": (context) => const Splash(),
        "Splash1": (context) => Splash1(),
        "Splash2": (context) => Splash2(),
        "First": (context) => First(),
        "Second": (context) => Second(),
        "Verification": (context) => Verification(),
        "Homepage": (context) => Homepage(),
        "Camera": (context) => Camera(),
        "Search": (context) => Search(),
        "Detailpage": (context) => Detailpage(),
        "Cart": (context) => Cart(),
        "Totallist": (context) => Totallist(),
        "Fruite": (context) => Fruite(),
        "Gujarati": (context) => Gujarati(),
        "Healthyfood": (context) => Healthyfood(),
        "Mp": (context) => Mp(),
        "North": (context) => North(),
        "Punjabi": (context) => Panjabi(),
        "RFood": (context) => RFood(),
        "Salad": (context) => Salad(),
        "South": (context) => South(),
        "Foodrecipe": (context) => Foodrecipe(),
        "Fruiterecipe":(context) => Fruiterecipe(),
        "Saladrecipe":(context) => Saladrecipe(),
        "Feedbackpage":(context) => Feedbackpage(),
        "Frrecipe": (context) =>Frrecipe(),

      },
    );
  }
}

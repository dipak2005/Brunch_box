import 'package:flutter/rendering.dart';

List<Map<String, dynamic>> foodlist = [
  {
    "image": "assets/h1.png",
    "name": "healthy food",
    "price": " 100",
    "rating": "4.3",
    "product": 1,
    "delivery": 20,
    "discount": "20",
  },
  {
    "image": "assets/h2.png",
    "name": "healthy veg spicies",
    "price": " 400",
    "rating": "4.5",
    "product": 1,
    "delivery": 20,
    "discount": "40",
    "discount": "10",
  },
  {
    "image": "assets/h3.png",
    "name": "morning  fruite seck",
    "price": " 600",
    "rating": "4.8",
    "product": 1,
    "delivery": 20,
    "discount": "70",
    "discount": "30",
  },
  {
    "image": "assets/h4.png",
    "name": "healthy breakfast",
    "price": " 300",
    "rating": "3.7",
    "product": 1,
    "delivery": 20,
    "discount": "60",
    "discount": "40",
  },
  {
    "image": "assets/h5.png",
    "name": "mix salad",
    "price": " 400",
    "rating": "4.1",
    "product": 1,
    "delivery": 20,
    "discount": "30",
    "discount": "50",
  },
  {
    "image": "assets/h6.png",
    "name": "morning bread",
    "price": " 300",
    "rating": "3.8",
    "product": 1,
    "delivery": 20,
    "discount": "80",
    "discount": "20",
  },
  {
    "image": "assets/h7.png",
    "name": "veg breakfast",
    "price": " 400",
    "rating": "3.9",
    "product": 1,
    "delivery": 20,
    "discount": "20",
    "discount": "30",
  },
  {
    "image": "assets/h8.png",
    "name": "healthy salad",
    "price": " 200",
    "rating": "4.2",
    "product": 1,
    "delivery": 20,
    "discount": "10",
    "discount": "40",
  },
  {
    "image": "assets/h4.png",
    "name": "healthy food",
    "price": " 100",
    "rating": "4.3",
    "product": 1,
    "delivery": 20,
    "discount": "40",
    "discount": "60",
  },
  {
    "image": "assets/h3.png",
    "name": "healthy pasata",
    "price": " 100",
    "rating": "4.3",
    "product": 1,
    "delivery": 20,
    "discount": "60",
    "discount": "70",
  },
];

List<Map<String, dynamic>> cartlist = [];
double? hight;
double? width;

Signin signin=Signin();
class Signin{
  String? name;
  String? email;
  String? password;
}
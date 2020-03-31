import 'dart:ui';
import 'package:flutter/material.dart'; 
import 'package:flutter_icons/flutter_icons.dart';

//Global Colors
const DarkBlue = Color.fromRGBO(0, 0, 139, 1);
const BabyBlue = Color.fromRGBO(43, 133, 250, 1);
const LightBlue = Color.fromRGBO(98, 157, 233, 1); 
const Cyan = Color.fromRGBO(0, 255, 255, 1);
const DarkTurquoise = Color.fromRGBO(0, 206, 209, 1);
const DarkCyan = Color.fromRGBO(0, 139, 139, 1);
const Teal = Color.fromRGBO(0, 128, 128, 1);
const Navy = Color.fromRGBO(0, 0, 128, 1);


//More Colors Here: 
//https://www.rapidtables.com/web/color/html-color-codes.html

TextStyle listTitleDefaultTextStyle = TextStyle(color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle listTitleSelectedTextStyle = TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);


String lorem =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas at, aspernatur blanditiis veritatis nam ea corrupti architecto, ipsum dolor sunt facere quasi, laborum fugiat earum laudantium adipisci corporis esse magnam.";

class Product {
  final String title, description, price, img;
  Product({this.title, this.description, this.price, this.img});
}

List<Product> productsList = [
  Product(
    description: lorem,
    title: "Brown Sugar",
    price: "\$8.99",
    img:
        "https://www.journee-mondiale.com//medias/grande/images/journee/hamburger.png",
  ),
  Product(
    description: lorem,
    title: "Cheesy Jalapenos",
    price: "\$5.93",
    img:
        "https://huggysbar.com/wp-content/uploads/2019/06/Cheesy_Jalapenos.png",
  ),
  Product(
    description: lorem,
    title: "Brown Sugar",
    price: "\$6.99",
    img:
        "https://www.stickpng.com/assets/images/580b57fcd9996e24bc43c1a8.png",
  ),
  Product(
    description: lorem,
    title: "Speed Burger",
    price: "\$8.99",
    img:
        "https://www.speed-burger.com/images/585x585/carte_articles/carte_hiver_19_20/SPEED-BURGER-CHARISMATIK-DETAIL.png",
  ),
  Product(
    description: lorem,
    title: "Brown Sugar",
    price: "\$8.99",
    img:
        "http://french.peopledaily.com.cn/NMediaFile/2016/0206/FOREIGN201602060850000565854639675.png",
  ),

];

class Category {
  final String title;
  final IconData icon;

  Category({this.title, this.icon});
}

List<Category> cats = [
  Category(
    icon: MaterialCommunityIcons.hamburger,
    title: "Hamburger",
  ),
  Category(
    icon: MaterialIcons.local_pizza,
    title: "Pizza",
  ),
  Category(
    icon: FontAwesome.coffee,
    title: "Coffee",
  ),
  Category(
    icon: MaterialIcons.local_drink,
    title: "Milk",
  ),
  Category(
    icon: MaterialCommunityIcons.tea,
    title: "Tea",
  ),
];
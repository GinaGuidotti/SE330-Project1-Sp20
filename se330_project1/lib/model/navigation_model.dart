import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;
  String path;  //Not being used currently

  NavigationModel({this.title, this.icon, this.path});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Home", icon: Icons.home, path: 'HomePage'),
  NavigationModel(title: "All Cameras", icon: Icons.store, path: 'Shopping'),
  NavigationModel(title: "Favorites", icon: Icons.favorite, path: 'Favorites'),
  NavigationModel(title: "Saved", icon: Icons.bookmark, path: 'Saved'),
  NavigationModel(title: "Cart", icon: Icons.shopping_cart, path: 'Cart'),
  NavigationModel(title: "Contact Us", icon: Icons.help, path: 'ContactUs'),
];
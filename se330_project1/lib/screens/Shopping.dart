import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';   
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/main.dart'; 
import 'package:se330_project1/screens/searchCameras.dart';
import 'package:se330_project1/screens/Cart.dart';

class Shopping extends StatefulWidget { 
  @override
  createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<Shopping>{ 
  Future navigateToCart(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
    //This pushes the entire scaffold to be Cart
  }

   Widget build(BuildContext context) {     
   return new Scaffold( 
        
        drawer: CollapsingNavigationDrawer(),
        body: CameraListHome(),
        
      );
  }

} 

  
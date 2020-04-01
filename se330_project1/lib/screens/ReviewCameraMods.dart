import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class ReviewCameraMod extends StatefulWidget { 
  @override
  createState() => _ReviewCameraModPageState();

}

class _ReviewCameraModPageState extends State<ReviewCameraMod>{ 
  

  Widget build(BuildContext context) {   
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.07, color: Colors.black); 

     return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: screenWidth*0.10,),
          
          
        ],
      ),

    ); 
  }

}

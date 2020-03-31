import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';   
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/model/CameraList.dart';
//import 'package:se330_project1/main.dart'; 
import 'package:se330_project1/screens/searchCameras.dart';

class Shopping extends StatefulWidget { 
  @override
  createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<Shopping>{ 
   Widget build(BuildContext context) {     
   return new Scaffold( 
        appBar: AppBar(
          backgroundColor: DarkCyan,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[               
              Text('Our Cameras'),
              IconButton(
                icon: Icon(Icons.search), 
                onPressed: (){ 
                  showSearch(context: context, delegate: Search());
                }
              ),
            ],
          ),
        ),
        drawer: CollapsingNavigationDrawer(),
        body: CameraListHome(),
      );
  }

} 

  
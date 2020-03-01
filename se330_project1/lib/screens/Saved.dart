import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class Saved extends StatefulWidget { 
  @override
  createState() => _SavedPageState();
}

class _SavedPageState extends State<Saved>{ 

  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width;
  //  double screenHeight = MediaQuery.of(context).size.height; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   return new Scaffold( 
        appBar: AppBar(
          title: Text('Saved'),
        ),
        drawer: CollapsingNavigationDrawer(),
        body: new Center(
          child: new ListView( 
            children: <Widget>[ 
              SizedBox(height: screenWidth * 0.03),
              Text(
                'Just Clicked Cameras',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: (screenWidth * 0.07), 
                ),
              ),             
              SizedBox(height: screenWidth * 0.02),
              ListTile(
                title: Text('Current Page:', style: italicTitle,),
                subtitle: Text('THIS IS saved ',
                  style: style),
              ),

              SizedBox(height: screenWidth * 0.02),
            ],
          ), 
        ),
      );
  }

}
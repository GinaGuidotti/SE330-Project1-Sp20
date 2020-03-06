import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class HomePage extends StatefulWidget { 
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{ 

  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width;
  //  double screenHeight = MediaQuery.of(context).size.height; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   return new Scaffold(  
        appBar: AppBar(
          title: Text('Home Page'),
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
              SizedBox(height: screenWidth * 0.1),
              ListTile(
                title: Text('About Us', style: italicTitle),
                subtitle: Text((
                  'its me'),
                  style: style),
              ),
              SizedBox(height: screenWidth * 0.02),
              ListTile(
                title: Text('Our Company:', style: italicTitle,),
                subtitle: Text('full potential.',
                  style: style),
              ),
              SizedBox(height: screenWidth * 0.02),
              ListTile(
                title: Text('Special Note', style: italicTitle,),
                subtitle: Text( 'hiya .',
                  style: style),
              ),              
              SizedBox(height: screenWidth * 0.02),
              ListTile(
                title: Text('Contact Us At:', style: italicTitle,),
                subtitle: Text('Call (605)697-6624 ',
                  style: style),
              ),

              SizedBox(height: screenWidth * 0.02),
            ],
          ), 
        ),
      );
  }

}
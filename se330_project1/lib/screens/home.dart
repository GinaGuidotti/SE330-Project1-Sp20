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
   //double screenHeight = MediaQuery.of(context).size.height; 
   //TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle blueStyle = TextStyle(fontSize: screenWidth*0.05, color: DarkCyan);   
   TextStyle blueLargeStyle = TextStyle(fontSize: screenWidth*0.07, color: DarkCyan, fontWeight: FontWeight.bold); 
   //TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   TextStyle italicBlueTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic, color: DarkCyan, fontWeight: FontWeight.bold);
   return new Scaffold(          
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: DarkCyan,
        ),
        drawer: CollapsingNavigationDrawer(),
        body: new Center(
          child: new ListView( 
            children: <Widget>[ 
              SizedBox(height: screenWidth * 0.06),
              Text(
                'Just Clicked Cameras',
                textAlign: TextAlign.center,
                style: blueLargeStyle,
              ),
              SizedBox(height: screenWidth * 0.1),
              ListTile( 
                subtitle: Text((
                  'Tired of scrolling on Instagram or Pinterest wishing you could be on that perfect family vacation '
                  +'or could take that beautiful of a picture without using a fancy filter?\n'), 
                  style: blueStyle),
              ), 
              ListTile( 
                subtitle: Text(( 
                  'Well now you can!\n'
                  ),
                  style: italicBlueTitle),
              ), 
              ListTile( 
                subtitle: Text((  
                  'Just come check out any of our Just Clicked Camera styles and we can make your wish come true! '),
                  style: blueStyle),
              ),
              SizedBox(height: screenWidth * 0.1),
              Divider(height: 20, color: DarkCyan, thickness: 3.0,), 
              ListTile(
                title: Text('About Our Company:', style: italicBlueTitle,),
                subtitle: Text(
                  'Our three creating developers met during their Undergraduate years at South Dakota State University during '
                +'the Fall of 2016. Over the years, they had many classes and projects together but in their fourth year of '
                +'Undergrad they came together and thought of an idea for some product they could sell. '
                +'They thought and thought for so long until the title just clicked and thus "Just Clicked Cameras" came to be.',
                  style: blueStyle),
              ),
              SizedBox(height: screenWidth * 0.05),
              ListTile(
                title: Text('Special Note For Our Customers!', style: italicBlueTitle,),
                subtitle: Text( 'This is only a project for a class and this does not exist in real life as a shop or a source of professional cameras, '
                +'so please don\'t think this is a real company and actually use your real payment information. \nThis is just made for fun! (and class too)',
                  style: blueStyle),
              ), 
              SizedBox(height: screenWidth * 0.05),
            ],
          ), 
        ),
      );
  }

}
import 'package:flutter/material.dart';   

class AboutUs extends StatefulWidget { 
  @override
  createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUs>{ 
  @override
  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   return new Scaffold( 
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
                title: Text('Philosophy', style: italicTitle),
                subtitle: Text((
                  'Test1'),
                  style: style),
              ),
              SizedBox(height: screenWidth * 0.02), 
            ],
          ), 
        ));
  }
  

} 
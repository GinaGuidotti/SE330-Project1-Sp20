import 'package:flutter/material.dart';    
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class ErrorPage extends StatefulWidget { 
  @override
  createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage>{  
  @override
  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   
   return new Scaffold( 
        appBar: AppBar(
          title: Text('Error 404'),
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
                title: Text('ERROR: ', style: italicTitle),
                subtitle: Text((
                  'This Page Does Not Exist. Please Try Again Later'),
                  style: style),
              ),
               

            ],
          ), 
        ));
  }
  

} 
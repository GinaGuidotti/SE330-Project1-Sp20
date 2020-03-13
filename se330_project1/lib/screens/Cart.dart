import 'package:flutter/material.dart';   
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class Cart extends StatefulWidget { 
  @override
  createState() => _CartPageState();
}

class _CartPageState extends State<Cart>{ 
  @override
  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   return new MaterialApp( 
     debugShowCheckedModeBanner: false,  
     home: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: DarkCyan,
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
                title: Text('This is future', style: italicTitle),
                subtitle: Text((
                  'CART'),
                  style: style),
              ),
              SizedBox(height: screenWidth * 0.02), 
            ],
          ), 
        )
       )  
    );
  }
  

} 
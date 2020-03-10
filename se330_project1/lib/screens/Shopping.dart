import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class Shopping extends StatefulWidget { 
  @override
  createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<Shopping>{ 

  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width;
  //  double screenHeight = MediaQuery.of(context).size.height; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   return new Scaffold( 
        appBar: AppBar(
          title: Text('Shopping Page'),
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
                subtitle: Text('THIS IS SHOPPING ',
                  style: style),
              ),

              SizedBox(height: screenWidth * 0.02),
            ],
          ), 
        ),
      );
  }

}

// void main() {
//   runApp(new MaterialApp(
//     title: 'Demo App',
//     home: new CameraList(cameras:
//       [
//         new CameraDatabase("Canon", "EOS 2000D", 299.99),
//         new CameraDatabase("Canon", "EOS C200 EF CINEMA", 6499.00 ),
//         new CameraDatabase("Nikon", "D5 DSLR", 4429.00),
//         new CameraDatabase("Nikon",  "D3500 DSLR", 388.00),
        
//       ],),
//   ));
// }
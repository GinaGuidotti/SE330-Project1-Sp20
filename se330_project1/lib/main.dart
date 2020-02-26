import 'package:flutter/material.dart';
import 'package:se330_project1/home.dart';

void main(){
  runApp(JustClickedCamerasApp());
}

class JustClickedCamerasApp extends StatelessWidget{
  // @override 
  // Widget build(BuildContext context){
  //   return MaterialApp(home: Text('hiya'));
  // }

  Widget build(BuildContext context) {     
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   return Scaffold(
      appBar: AppBar( 
        title: Text('Just Clicked Cameras', style: TextStyle(fontSize: screenWidth*0.10)),
        backgroundColor: Color.fromRGBO(153, 23, 0, 1),
      ),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'tempString',
            ),
          ],
        ),
      ),
    );
  }
}

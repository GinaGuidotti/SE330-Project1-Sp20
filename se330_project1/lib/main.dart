import 'package:flutter/material.dart'; 
import 'package:se330_project1/globalvariables.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'dart:convert'; 
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

void main(){ 
  runApp(
    MyApp( )
  );
}

class MyApp extends StatelessWidget{

  @override
  Widget build( BuildContext context){     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Clicked Cameras Main UI',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: DarkCyan, 
          ),
      home: MyMainPage(),
      );    
  }
}

class MyMainPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
   double screenWidth = MediaQuery.of(context).size.width;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
    return Scaffold(
      appBar: AppBar(
        title: Text('Just Clicked Cameras'),
      ),
      drawer: CollapsingNavigationDrawer(),
      body: Text('Future Login? or click to enter as guest', style: style),

    );
  }
}

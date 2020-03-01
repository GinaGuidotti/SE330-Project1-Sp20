import 'package:flutter/material.dart';
import 'package:se330_project1/screens/home.dart';
import 'package:se330_project1/globalvariables.dart'; 
import 'package:se330_project1/screens/wrapper/bloc/header_bloc.dart';
import 'package:se330_project1/sidebar/bloc/sidebar_bloc.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:se330_project1/screens/wrapper/wrapper.dart';
import 'dart:convert'; 


void main(){ 
  runApp(
    JustClickedCamerasApp( )
  );
}

Widget JustClickedCamerasApp( ){     
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Just Clicked Cameras Main UI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: DarkCyan, 
        ),
     home: MultiBlocProvider(
          providers: [ 
            BlocProvider<SidebarBloc>(
              create: (context) => SidebarBloc(),
            ),
            BlocProvider<HeaderBloc>(
              create: (context) => HeaderBloc(),
            )
          ],
          child: Wrapper(),
        ), 
    );
  
}


Widget build(BuildContext context) {     
  //  double screenWidth = MediaQuery.of(context).size.width;
  //  double screenHeight = MediaQuery.of(context).size.height;
  return Scaffold( 
      appBar: AppBar( 
        title: Text('Just Clicked Cameras', style: TextStyle(fontSize: 20)),
        backgroundColor: DarkCyan,
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
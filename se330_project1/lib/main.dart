import 'package:flutter/material.dart'; 
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

class SetUpHttp extends StatefulWidget{
final String title = 'Set Up Http';
@override
_MyHttpSetup createState() => _MyHttpSetup();
}

class _MyHttpSetup extends State<SetUpHttp>{
var realString = "";
 
@override
void initState(){ 

}

Widget build(BuildContext context) {      
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
              realString,
            ),
          ],
        ),
      ),
    );
  }

}

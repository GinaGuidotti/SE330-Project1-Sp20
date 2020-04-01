import 'package:flutter/material.dart'; 
import 'package:se330_project1/globalvariables.dart';  
//import 'package:flutter_bloc/flutter_bloc.dart';  
//import 'dart:convert'; 
import 'package:se330_project1/screens/home.dart'; 
//import 'package:se330_project1/navigation/custom_navigation_drawer.dart'; 
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/CartItems.dart';  
import 'package:se330_project1/main.dart';

class AccountCreation extends StatelessWidget{

  @override
  Widget build( BuildContext context){     
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Clicked Cameras Main UI',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: DarkCyan, 
          ),
      home: AccountCreationPage(),
      );    
  }
}

class AccountCreationPage extends StatelessWidget{
  String username, password, confirmPassword;

  Future navigateToHome(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future naaviageToLogin(context) async {
    //Navigator.pop(context); 
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }
 

  @override 
  Widget build(BuildContext context){
    
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.07, color: Colors.black);  
    bool passwordsDoNotMatch = false; 

    checkPasswordStatus(){
      if(password != confirmPassword){
        passwordsDoNotMatch = true;
      }else{
        passwordsDoNotMatch = false;
      }
    }

    final userNameField = TextField(
      onChanged: (String value){ 
        username = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passWordField = TextField(
      onChanged: (String value){ 
        password = value;
      }, 
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final recheckPassword = TextField(
      onChanged: (String value){ 
        confirmPassword = value;
      }, 
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Confirm Password",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

       
    final createAccountButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: DarkCyan,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.9,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () { 
           
          checkPasswordStatus();
          if(passwordsDoNotMatch == false){ 
            navigateToHome(context);
          }else{            
            (context as Element).markNeedsBuild();
          }
          
        },         
        child: Text('Create Account', style: style, textAlign: TextAlign.center,)              
      ),
    );
 
    String _PasswordStatus(bool theStatus){
      if(theStatus == false){ //no Login Errors in sight
        return(' ');
      }else{
        return('Error: Username or Password is incorrect');
      }
    }


    final PasswordStatus = Text(
      _PasswordStatus(passwordsDoNotMatch),
      style: bigStyle,
      textAlign: TextAlign.center,
    );
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: (){
            //navigateToLogin(context);

          }
          ),
        title: Text('Account Creation'),
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: screenWidth*0.10,),
          SizedBox(height: screenHeight*0.2, child: Image.asset('assets/JCClogo.jpg')),
          Text('Just Clicked Cameras', style: bigStyle),
          SizedBox(height: screenWidth*0.05,),
          userNameField,
          SizedBox(height: screenWidth*0.02,),
          passWordField,
          SizedBox(height: screenWidth*0.02,),
          recheckPassword,
          SizedBox(height: screenWidth*0.05,),
          (PasswordStatus),
          // Divider(thickness: 2.0, color: DarkCyan, height: 20),
          SizedBox(height: screenWidth*0.05,),
          createAccountButton

          
        ],
      ),

    );
  }
   
}

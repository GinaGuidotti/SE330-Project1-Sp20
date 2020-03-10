import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/model/helpEmailDatabase.dart';   
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class ContactUs extends StatefulWidget { 
  @override
  createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUs>{ 
  String userEmail, userComment, userFName, userLName;
  bool contactEmailSent = false;



  @override
  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);

  final emailField = TextField(
    onChanged: (String value){
      setState(() {
        userEmail = value;
      });
    }, 
    obscureText: false,
    style: style,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "Email",
      border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final firstNameField = TextField(
    onChanged: (String value){
      setState(() {
        userFName = value;
      });
    }, 
    obscureText: false,
    style: style,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "First Name",
      border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final lastNameField = TextField(
    onChanged: (String value){
      setState(() {
        userLName = value;
      });
    }, 
    obscureText: false,
    style: style,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "Last Name",
      border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final commentField = TextField(
    onChanged: (String value){
      setState(() {
        userComment = value;
      });
    }, 
    obscureText: false,
    style: style,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      hintText: "Comments",
      border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final confirmButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: DarkCyan,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () {
          print('All sent!');
          contactEmailSent = true;
          //EmailDatabase.add(new EmailDatabase(userFName, userLName, userEmail, userComment));
        },
         
        child: contactEmailSent ? Text('Email Sent!', textAlign: TextAlign.center,) : Text('Send Message', textAlign: TextAlign.center,) 
             
      ),
  );


   return new Scaffold( 
        appBar: AppBar(
          title: Text('Contact Us'),
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
                title: Text('Contact Us!', style: italicTitle),
                subtitle: Text((
                  'Feel Free to send us an email with any questions or concerns about your order at: \n      JustClickedCameras@outlook.com \n\n             or fill out the form below'),
                  style: style),
              ),
              
              SizedBox(height: screenWidth * 0.15), 
              emailField,
              SizedBox(height: screenWidth * 0.02), 
              commentField,              
              SizedBox(height: screenWidth * 0.1), 
              confirmButton,              
              SizedBox(height: screenWidth * 0.1), 


            ],
          ), 
        ));
  }
  

} 
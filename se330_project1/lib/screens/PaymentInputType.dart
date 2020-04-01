import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:se330_project1/globalvariables.dart';  
import 'package:se330_project1/screens/home.dart'; 
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/PaymentDatabase.dart';  
import 'package:se330_project1/main.dart';

class PaymentType extends StatelessWidget{

  @override
  Widget build( BuildContext context){     
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enter Payment Information',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: DarkCyan, 
          ),
      home: PaymentTypePage(),
      );    
  }
}

class PaymentTypePage extends StatelessWidget{
  String  streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate;

  // Future navigateToHome(context) async {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  // }

  // Future naaviageToLogin(context) async {
  //   //Navigator.pop(context); 
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  // }
 

  @override 
  Widget build(BuildContext context){
    
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.07, color: Colors.black);  

    final streetAddressField = TextField(
      onChanged: (String value){ 
        streetAddress = value;
      }, 
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Billing Address",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final cityField = TextField(
      onChanged: (String value){ 
        city = value;
      }, 
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "City",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final stateField = TextField(
      onChanged: (String value){ 
        state = value;
      }, 
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "State",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final zipCodeField = TextField(
      onChanged: (String value){ 
        zipCode = value;
      }, 
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Zip Code",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final nameField = TextField(
      onChanged: (String value){ 
        nameOnCard = value;
      }, 
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Name as it appears on Card",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final creditCardField = TextField(
      onChanged: (String value){ 
        creditNumber = value;
      }, 
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Credit Card Number",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final cvvField = TextField(
      onChanged: (String value){ 
        cvv = value;
      }, 
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "CVV",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
       
    final exDateField = TextField(
      onChanged: (String value){ 
        expirationDate = value;
      }, 
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "CC Expiration Date",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final submitPaymentButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: DarkCyan,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.9,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () {    
          paymentInfo.add(new PaymentData(streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate));       
        },         
        child: Text('Submit Payment', style: style, textAlign: TextAlign.center,)              
      ),
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
          //SizedBox(height: screenHeight*0.2, child: Image.asset('assets/JCClogo.jpg')),
          Text('Billing Address', style: bigStyle),
          SizedBox(height: screenWidth*0.05,),
          streetAddressField,
          SizedBox(height: screenWidth*0.02,),
          cityField,
          SizedBox(height: screenWidth*0.02,),
          stateField,
          SizedBox(height: screenWidth*0.05,),
          zipCodeField,
          SizedBox(height: screenWidth*0.10,),
          Text('Credit Card Info', style: bigStyle),
          SizedBox(height: screenWidth*0.05,),
          nameField,
          SizedBox(height: screenWidth*0.05,),
          creditCardField,
          SizedBox(height: screenWidth*0.05,),
          cvvField,
          SizedBox(height: screenWidth*0.05,),
          exDateField,
          // Divider(thickness: 2.0, color: DarkCyan, height: 20),
          SizedBox(height: screenWidth*0.05,),
          submitPaymentButton
        ],
      ),

    );
  }
   
}

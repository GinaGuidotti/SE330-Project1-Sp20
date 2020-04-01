import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:se330_project1/globalvariables.dart';  
import 'package:se330_project1/screens/home.dart'; 
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/PaymentDatabase.dart';  
import 'package:se330_project1/main.dart';
import 'package:se330_project1/screens/reviewAllInfo.dart';
import 'package:se330_project1/screens/PersonalInfo.dart';

class PaymentType extends StatefulWidget{ 
  @override
  createState() => PaymentTypePage();
}


class PaymentTypePage extends State<PaymentType>{
  String streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate;

  Future navigateBackToPersonalInfo(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalInfo()));
  }

  Future navigateToReviewAllInfo(context) async { 
    Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewList()));
  }
 

  @override 
  Widget build(BuildContext context){
    
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.black);  
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white);


    final backAPageButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.2, 
        onPressed: () {            
          navigateBackToPersonalInfo(context);
        },
        child: Icon(Icons.chevron_left, color: Colors.white, size: screenWidth*0.06),
      ),
    );


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
      elevation: 2.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.8, 
        onPressed: () {    
          print('test me')       ;
          paymentInfo.add(PaymentData(streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate));       
          navigateToReviewAllInfo(context);
        },
        child: Text('Continue to Review Item', style: whiteStyle),
      ),
    );
     
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Information'),
        backgroundColor: DarkCyan,
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: screenWidth*0.02,),
          //SizedBox(height: screenHeight*0.2, child: Image.asset('assets/JCClogo.jpg')),
          Text('Billing Address', style: bigStyle, textAlign: TextAlign.center), 
          streetAddressField,
          SizedBox(height: screenWidth*0.01,),
          cityField,
          SizedBox(height: screenWidth*0.01,),
          stateField,
          SizedBox(height: screenWidth*0.01,),
          zipCodeField,
          SizedBox(height: screenWidth*0.02,),
          Text('Credit Card Info', style: bigStyle, textAlign: TextAlign.center), 
          nameField,
          SizedBox(height: screenWidth*0.01,),
          creditCardField,
          SizedBox(height: screenWidth*0.01,),
          cvvField,
          SizedBox(height: screenWidth*0.01,),
          exDateField, 
          SizedBox(height: screenWidth*0.05,), 
        ],
      ), 
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            backAPageButton,  
            submitPaymentButton,
          ],
        ),

    );
  }   
}

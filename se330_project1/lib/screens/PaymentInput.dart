import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/main.dart';
import 'package:se330_project1/screens/Cart.dart';

class PaymentInfo extends StatefulWidget { 
  @override
  createState() => _PaymentInfoPageState();
}

class _PaymentInfoPageState extends State<PaymentInfo>{
  String cartNumber, exprDate;

  Future navigateBackToCart(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }

  Future navigateForwardToPaymentInfo(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentInfo()));
  }

  Widget build(BuildContext context) {   
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.07, color: Colors.black); 

    final backAPageButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () {            
          navigateBackToCart(context);
        },
        child: Icon(Icons.chevron_left, color: Colors.white, size: screenWidth*0.06),
      ),
    );

    final continueButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () {            
          navigateBackToCart(context);
        },
        child: Text('Continue to Payment Info'),
      ),
    );
    

    // final firstNameField = TextField(
    //   onChanged: (String value){ 
    //     firstName = value;
    //   }, 
    //   obscureText: false,
    //   style: style,
    //   decoration: InputDecoration(
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //     hintText: "FirstName",
    //     border:
    //       OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    // );
    

     return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: screenWidth*0.10,),
          // firstNameField,          
          SizedBox(height: screenWidth*0.02,),
          
        ],
      ),
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            backAPageButton,             
            continueButton,
          ],
        ),
    ); 
  }

}



import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'dart:math';
import 'package:se330_project1/model/orderDatabase.dart';
import 'package:se330_project1/screens/Shopping.dart';
import 'package:se330_project1/model/CartItems.dart';
import 'package:se330_project1/main.dart';

class Confirmation extends StatefulWidget { 
  @override
  createState() => _ConfirmationPageState();

}

class _ConfirmationPageState extends State<Confirmation>{ 
  String orderNum;

  String orderNumberGeneration(){ 
    Random random = new Random();
    int randomNumber = random.nextInt(1000000000)+1;
    return randomNumber.toString();
  }

  Future navigateToShopPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Shopping()));
  }

  Widget build(BuildContext context) {   
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.07, color: Colors.black); 
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white); 
    orderNum = orderNumberGeneration();


    final continueButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.7, 
        //minWidth: screenWidth*0.5, //for with addToCartButton
        onPressed: () {           
          camerasInCart = new List<CartList>();
          (context as Element).markNeedsBuild();
          navigateToShopPage(context);
        },
        child: Text('Back To Shopping!!', style: whiteStyle)    
      ),
    );

     return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
        backgroundColor: DarkCyan,
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: screenWidth*0.10,),
          Text('Thank you for your order!', style: bigStyle, textAlign: TextAlign.center,),
          Text('Your Order #: ' + orderNum, style: style, textAlign: TextAlign.center,),
          SizedBox(height: screenWidth*0.1,), 
          Text('You have been sent a confirmation email.', style: style, textAlign: TextAlign.center,),
          SizedBox(height: screenWidth*0.1,), 
          Text('Keep an eye out at the address you provided for your Camera to ship. If it is two weeks after the original arrival date and the Camera has not been received yet, please send an email or call us and we will help find it. ', style: style, textAlign: TextAlign.center,),
          SizedBox(height: screenWidth*0.1,),
          Text('Please Contact Us if there are any issues with your order!', style: bigStyle, textAlign: TextAlign.center,),
          SizedBox(height: screenWidth*0.15,), 
        ],
      ),
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
            continueButton,
          ],
        ),
    ); 
  }

}

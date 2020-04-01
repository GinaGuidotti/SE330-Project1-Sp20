import 'package:flutter/material.dart';   
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/model/CartItems.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/main.dart';
import 'package:se330_project1/screens/PersonalInfo.dart';

class Cart extends StatefulWidget { 
  @override
  createState() => _CartPageState();
}

class _CartPageState extends State<Cart>{ 
   Future navigateToPayment(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalInfo()));
  }
  
  @override
  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width;    
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white); 


   final purchaseButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(        
        minWidth: screenWidth, 
        onPressed: () {  
          navigateToPayment(context);           
        },
        child: Text('Continue to Payment', style: whiteStyle)    
      ),
    );


   return new Scaffold(  
      appBar: AppBar(
          backgroundColor: DarkCyan,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[               
              Text('Cart'),
              
            ],
          ),
        ), 
        drawer: CollapsingNavigationDrawer(),
        body: CartListHome(),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[              
            purchaseButton,
          ],
        ),
      );
  } 
  }
  

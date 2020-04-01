import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/screens/PaymentInput.dart';  
import 'package:se330_project1/screens/home.dart'; 
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/PaymentDatabase.dart';  
import 'package:se330_project1/main.dart';
import 'package:se330_project1/screens/ConfirmationPage.dart';
import 'package:se330_project1/model/orderDatabase.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/screens/PaymentInput.dart';  
import 'package:se330_project1/screens/reviewAllInfo.dart';

 class ReviewCamera extends StatefulWidget { 
  @override
  createState() => ReviewCameraInfoBody();
} 


int personIndex = 0;
class ReviewCameraInfoBody extends State<ReviewCamera>{
  String fullname, streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate; 
  double totalPrice;

  Future navigateBackToPaymentInfo(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewAllInfo()));
  }

  Future navigateToConfirmation(context) async { 
    Navigator.push(context, MaterialPageRoute(builder: (context) => Confirmation()));
  }

  RichText modPrint = new RichText(text: TextSpan(text:'empty test'));
  Widget printModText(TextStyle modTitle, TextStyle smaller, int index){ 
    modPrint = new RichText(
      text: TextSpan(
        text: 'Modifications:',
        style: modTitle,
        children: <TextSpan>[
          TextSpan(text: ('\nColor: '), style: modTitle, ),
          TextSpan(text: camerasInCart[index].selectedColor.name + " ", style: modTitle),
          TextSpan(text: '\nLens: ', style: modTitle),
          TextSpan(text: camerasInCart[index].selectedExtraLens.name + " ", style: modTitle),
          TextSpan(text: '\nConfiguration: ', style: modTitle),
          TextSpan(text: camerasInCart[index].selectedConfig.name + " ", style: modTitle),
          TextSpan(text: '\nPlan: ', style: modTitle),
          TextSpan(text: camerasInCart[index].selectedPlan.name + " ", style: modTitle),
          TextSpan(text: '\nMemory Pack: ', style: modTitle),
          TextSpan(text: camerasInCart[index].selectedMemoryPack.name + " ", style: modTitle),
          //then put the other things here
        ]
      )
    );
    return modPrint;
  }
  RichText credPrint = new RichText(text: TextSpan(text:'empty test'));
  Widget printCreditText(TextStyle titleTitle, TextStyle modTitle, TextStyle smaller, int index){
    creditNumber = paymentInfo[personIndex].creditNumber;
    cvv = paymentInfo[personIndex].cvv;
    nameOnCard = paymentInfo[personIndex].nameOnCard;
    expirationDate = paymentInfo[personIndex].expirationDate;
    modPrint = new RichText(
      text: TextSpan(
        text: 'Credit Card Info:',
        style: titleTitle,        
        children: <TextSpan>[
          TextSpan(text: ('\nName as it appears on card: '), style: modTitle, ),
          TextSpan(text:  paymentInfo[personIndex].nameOnCard + " ", style: smaller),
          TextSpan(text: '\nLast 4 of CC Number: ', style: modTitle),
          TextSpan(text: paymentInfo[personIndex].creditNumber.substring(paymentInfo[personIndex].creditNumber.length-4, paymentInfo[index].creditNumber.length)+ " ", style: smaller),
          TextSpan(text: '\nCvv: ', style: modTitle),
          TextSpan(text: paymentInfo[personIndex].cvv + " ", style: smaller),
          TextSpan(text: '\nExpiration Date: ', style: modTitle),
          TextSpan(text: paymentInfo[personIndex].expirationDate + " ", style: smaller),
        ]
      )
    );
    return modPrint;
  }

  RichText billingPrint = new RichText(text: TextSpan(text:'empty test'));
  Widget printBillingAddressText(TextStyle titleTitle, TextStyle modTitle, TextStyle smaller, int index){
    streetAddress = paymentInfo[personIndex].streetAddress;
    paymentInfo[personIndex].city = city;
    state = paymentInfo[personIndex].state;
    zipCode = paymentInfo[personIndex].zipCode; 
    modPrint = new RichText(
      text: TextSpan(
        text: 'Billing Address:',
        style: titleTitle,
        children: <TextSpan>[
          TextSpan(text: ('\nStreet Address: '), style: modTitle, ),
          TextSpan(text: paymentInfo[personIndex].streetAddress + " ", style: smaller),
          // TextSpan(text: '\nCity: ', style: modTitle),
          // TextSpan(text: paymentInfo[personIndex].city + " ", style: smaller),
          TextSpan(text: '\nState: ', style: modTitle),
          TextSpan(text: paymentInfo[personIndex].state + " ", style: smaller),
          TextSpan(text: '\nZip Code: ', style: modTitle),
          TextSpan(text: paymentInfo[personIndex].zipCode + " ", style: smaller),
        ]
      )
    );
    return modPrint;
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextStyle style = TextStyle(fontSize: screenWidth*0.06, color: Colors.black);
    TextStyle smaller = TextStyle(fontSize: screenWidth*0.04, color: Colors.black);  
    TextStyle modTitle = TextStyle(fontSize: screenWidth*0.05, color: Colors.black); 
    TextStyle title = TextStyle(fontSize: screenWidth*0.06, color: Colors.black, fontWeight: FontWeight.bold); 
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white); 
    totalPrice = totalCartPrice;

    final backAPageButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.2, 
        onPressed: () {            
          navigateBackToPaymentInfo(context);
        },
        child: Icon(Icons.chevron_left, color: Colors.white, size: screenWidth*0.06),
      ),
    );

    final continueButton = Material(
      elevation: 2.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.8, 
        onPressed: () {     
          orderInfo.add(OrderData(fullname, streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate, totalPrice.toString()));       
          navigateToConfirmation(context);
        },
        child: Text('Confirm Order', style: whiteStyle),
      ),
    );
     
    

    Widget _buildCard(int index) => SizedBox(
      height: screenHeight*0.85,
      child: Card(
        child: ListView(
          children: [
            ListTile(
              title:  Text( camerasInCart[index].brand,style: style, textAlign: TextAlign.center),
              subtitle:  Text( camerasInCart[index].model, style: style, textAlign: TextAlign.center),
              leading: Image.asset(camerasInCart[index].assetPath, width: 100, height: 100,),
            ),
            Divider(),
            ListTile(
              subtitle: printModText(modTitle, smaller, index)                  
            ),
            Divider(),
            ListTile(           
              title: Text('Quantity '+(camerasInCart[index].quantity).toString(),
                    style: style, textAlign: TextAlign.left),
            ),
            Divider(),
            ListTile( 
              title: Text('Total Base Price: \$'+(camerasInCart[index].basePrice).toStringAsFixed(2) + ' x '+camerasInCart[index].quantity.toString()+
                        '\nTotal Modification Price: \$'+(camerasInCart[index].totalModificationPrice).toStringAsFixed(2) + ' x '+camerasInCart[index].quantity.toString(),
                         style: smaller, textAlign: TextAlign.left),
              subtitle:Text('Total: \$'+(camerasInCart[index].totalPrice).toStringAsFixed(2),
                    style: style, textAlign: TextAlign.left),
            )
          ]
        )
      ));

      Widget _buildInfoCard() => SizedBox(
      height: screenHeight*0.85,
      child: Card(
        child: ListView(
          children: [
            ListTile(
              title:  printBillingAddressText(title, modTitle, smaller, 0), 
            ), 
            Divider(),
            ListTile(       
              title: printCreditText(title, modTitle, smaller, 0),
            ),
           
          ]
        )
      )
      );


    Widget getCartItems(BuildContext context){ 
      double size = (camerasInCart.length*500).toDouble();
      return SizedBox(
        height: size,
        child:  ListView.builder(
          itemCount: camerasInCart.length,
          itemBuilder: (context, index){
            totalPrice = totalPrice + camerasInCart[index].totalPrice;
            return  ListTile( 
                title: _buildCard(index),            
              
            );
          },
        ),
      );
    } 
  

    return Scaffold(
      appBar: AppBar(
        title: Text('Review Payment Information'),
        backgroundColor: DarkCyan,
      ),
      drawer: CollapsingNavigationDrawer(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: screenWidth*0.04,), 
          getCartItems(context), 
          SizedBox(height: screenWidth*0.04,),  
          SizedBox(height: screenWidth*0.1,),

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
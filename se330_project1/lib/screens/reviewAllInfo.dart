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

 class ReviewAllInfo extends StatefulWidget { 
  @override
  createState() => ReviewAllInfoBody();
} 



class ReviewAllInfoBody extends State<ReviewAllInfo>{
  String fullname, streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate; 

  Future navigateBackToPaymentInfo(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentType()));
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
  Widget printCreditText(TextStyle modTitle, TextStyle smaller, int index){
    creditNumber = paymentInfo[index].creditNumber;
    cvv = paymentInfo[index].cvv;
    nameOnCard = paymentInfo[index].nameOnCard;
    expirationDate = paymentInfo[index].expirationDate;
    modPrint = new RichText(
      text: TextSpan(
        text: 'Credit Card Info:',
        style: modTitle,
        children: <TextSpan>[
          TextSpan(text: ('\nName as it appears on card: '), style: modTitle, ),
          TextSpan(text:  paymentInfo[index].nameOnCard + " ", style: modTitle),
          TextSpan(text: '\nLast 4 of CC Number: ', style: modTitle),
          TextSpan(text: paymentInfo[index].creditNumber.substring(paymentInfo[index].creditNumber.length-4, paymentInfo[index].creditNumber.length)+ " ", style: modTitle),
          TextSpan(text: '\nCvv: ', style: modTitle),
          TextSpan(text: paymentInfo[index].cvv + " ", style: modTitle),
          TextSpan(text: '\nExpiration Date: ', style: modTitle),
          TextSpan(text: paymentInfo[index].expirationDate + " ", style: modTitle),
        ]
      )
    );
    return modPrint;
  }
  RichText billingPrint = new RichText(text: TextSpan(text:'empty test'));
  Widget printBillingAddressText(TextStyle modTitle, TextStyle smaller, int index){
    streetAddress = paymentInfo[index].streetAddress;
    paymentInfo[index].city = city;
    state = paymentInfo[index].state;
    zipCode = paymentInfo[index].zipCode; 
    modPrint = new RichText(
      text: TextSpan(
        text: 'Billing Address:',
        style: modTitle,
        children: <TextSpan>[
          TextSpan(text: ('\nStreet Address: '), style: modTitle, ),
          TextSpan(text: paymentInfo[index].streetAddress + " ", style: modTitle),
          TextSpan(text: '\nCity: ', style: modTitle),
          TextSpan(text: paymentInfo[index].city + " ", style: modTitle),
          TextSpan(text: '\nState: ', style: modTitle),
          TextSpan(text: paymentInfo[index].state + " ", style: modTitle),
          TextSpan(text: '\nZip Code: ', style: modTitle),
          TextSpan(text: paymentInfo[index].zipCode + " ", style: modTitle),
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
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white); 
    

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
          orderInfo.add(OrderData(fullname, streetAddress, city, state, zipCode, creditNumber, cvv, nameOnCard, expirationDate));       
          navigateToConfirmation(context);
        },
        child: Text('Confirm Order', style: whiteStyle),
      ),
    );
     
    

    Widget _buildCard(int index) => SizedBox(
      height: screenHeight*0.85,
      child: Card(
        child: Column(
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
              //leading: quantityButtons(index, screenWidth, context),            
              title: Text('Quantity '+(camerasInCart[index].quantity).toString(),
                    style: style, textAlign: TextAlign.left),
            ),
            Divider(),
            ListTile(
            //  leading: deleteButton(index, screenWidth, context),
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
        child: Column(
          children: [
            ListTile(
              title:  printBillingAddressText(modTitle, smaller, 0), 
            ),
            Divider(),
            ListTile(
              //subtitle: ??                   
            ),
            Divider(),
            ListTile(       
              title: printCreditText(modTitle, smaller, 0),
            ),
           
          ]
        )
      )
      );


    Widget getCartItems(BuildContext context){
      return ListView.builder(
        itemCount: camerasInCart.length,
        itemBuilder: (context, index){
          return  ListTile(
              title: _buildCard(index),            
            
          );
        },
        
      );
    } 
  

    return Scaffold(
      appBar: AppBar(
        title: Text('Review Information'),
        backgroundColor: DarkCyan,
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: screenWidth*0.04,),  
          getCartItems(context),
          SizedBox(height: screenWidth*0.05,),
          _buildInfoCard(),
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
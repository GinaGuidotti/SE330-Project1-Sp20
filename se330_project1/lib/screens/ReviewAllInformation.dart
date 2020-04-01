import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/screens/PaymentInputType.dart';  
import 'package:se330_project1/screens/home.dart'; 
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/PaymentDatabase.dart';  
import 'package:se330_project1/main.dart';

class CartListHome extends StatelessWidget {  
  //to see if the cart is empty or not
  bool cartEmpty = camerasInCart.isEmpty;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold( 
        body: cartEmpty ? 
        Text('\n\nYour cart is feeling sad because it\'s empty. \nPlease cheer it up! :)', style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.07, color: Colors.black), textAlign: TextAlign.center,) 
        : ReviewListBody(),
      ),
    );
  }
}

class ReviewListBody extends StatelessWidget{

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
  Widget printCreditText(TextStyle modTitle, TextStyle smaller){
    modPrint = new RichText(
      text: TextSpan(
        text: 'Credit Card Info:',
        style: modTitle,
        children: <TextSpan>[
          TextSpan(text: ('\nName as it appears on card: '), style: modTitle, ),
          //TextSpan(text:  + " ", style: modTitle),
          TextSpan(text: '\nCredit Card Number: ', style: modTitle),
          //TextSpan(text: camerasInCart[index].selectedExtraLens.name + " ", style: modTitle),
          TextSpan(text: '\nCvv: ', style: modTitle),
          //TextSpan(text: camerasInCart[index].selectedConfig.name + " ", style: modTitle),
          TextSpan(text: '\nExpiration Date: ', style: modTitle),
         // TextSpan(text: camerasInCart[index].selectedPlan.name + " ", style: modTitle),
        ]
      )
    );
    return modPrint;
  }
  RichText billingPrint = new RichText(text: TextSpan(text:'empty test'));
  Widget printBillingAddressText(TextStyle modTitle, TextStyle smaller){
    modPrint = new RichText(
      text: TextSpan(
        text: 'Billing Address:',
        style: modTitle,
        children: <TextSpan>[
          TextSpan(text: ('\nStreet Address: '), style: modTitle, ),
          //TextSpan(text: camerasInCart[index].selectedColor.name + " ", style: modTitle),
          TextSpan(text: '\nCity: ', style: modTitle),
         // TextSpan(text: camerasInCart[index].selectedExtraLens.name + " ", style: modTitle),
          TextSpan(text: '\nState: ', style: modTitle),
         // TextSpan(text: camerasInCart[index].selectedConfig.name + " ", style: modTitle),
          TextSpan(text: '\nZip Code: ', style: modTitle),
          //TextSpan(text: camerasInCart[index].selectedPlan.name + " ", style: modTitle),
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
              title:  printBillingAddressText(modTitle, smaller),
              //subtitle:  Text( , style: style, textAlign: TextAlign.center),
              //leading: Image.asset(camerasInCart[index].assetPath, width: 100, height: 100,),
            ),
            Divider(),
            ListTile(
              //subtitle:                   
            ),
            Divider(),
            ListTile(
              //leading: quantityButtons(index, screenWidth, context),            
              title: printCreditText(modTitle, smaller),
            ),
           
          ]
        )
      ));

    return ListView.builder(
      itemCount: camerasInCart.length,
      itemBuilder: (context, index){
        return  ListTile(
             title: _buildCard(index),            
          
        );
      },
      
    );
    }
    }
import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
//import 'package:se330_project1/screens/cameraItemModsView.dart';
//import 'package:se330_project1/screens/cameraItemView.dart';
import 'package:se330_project1/model/modifications.dart';
import 'package:se330_project1/main.dart';

class CartListHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold( 
        body: CartListBody(),
      ),
    );
  }
}

class CartList{
  String brand = " ";
  String model = " ";
  double basePrice = 0;
  String assetPath = " ";
  String cameraInfo = " ";
  int quantity = 0;
  double totalModificationPrice = 0.00;
  ColorChoice selectedColor;
  LensStyle selectedExtraLens;
  ProtectionPlan selectedPlan;
  ConfigPack selectedConfig;
  ExtraMemoryPack selectedMemoryPack;
  double totalPrice = 0;
  
  CartList(String a, String b, double c, String d, String e, int f, double g, 
  ColorChoice h, LensStyle i, ProtectionPlan j, ConfigPack k, ExtraMemoryPack l){
    brand = a;
    model = b;
    basePrice = c;
    assetPath = d;
    cameraInfo = e;
    quantity = f;
    totalModificationPrice = g;
    selectedColor = h;
    selectedExtraLens = i;
    selectedPlan = j;
    selectedConfig = k;
    selectedMemoryPack = l;
    totalPrice = quantity * (basePrice + totalModificationPrice);
  }

  CartList.addToCart(String a, String b, double c, String d, String e, int f, double g,
   ColorChoice h, LensStyle i, ProtectionPlan j, ConfigPack k, ExtraMemoryPack l){
    brand = a;
    model = b;
    basePrice = c;
    assetPath = d;
    cameraInfo = e;
    quantity = f;
    totalModificationPrice = g;
    selectedColor = h;
    selectedExtraLens = i;
    selectedPlan = j;
    selectedConfig = k;
    selectedMemoryPack = l;
    totalPrice = quantity * (basePrice + totalModificationPrice);
  }
}

class CartListBody extends StatelessWidget{
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextStyle style = TextStyle(fontSize: screenWidth*0.06, color: Colors.black);
    TextStyle smaller = TextStyle(fontSize: screenWidth*0.04, color: Colors.black);  
    TextStyle modTitle = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);
    
    Widget _buildCard(int index) => SizedBox(
      height: screenHeight*0.6,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title:  Text( camerasInCart[index].brand,style: style, textAlign: TextAlign.center, textDirection: TextDirection.ltr,),
              subtitle:  Text( camerasInCart[index].model, style: style, textAlign: TextAlign.center, textDirection: TextDirection.ltr,),
              leading: Image.asset(camerasInCart[index].assetPath, width: 100, height: 100,),
            ),
            Divider(),
            ListTile(
              title: Text('Modifications:',
                style: style, textAlign: TextAlign.left),
              subtitle: printModText(modTitle, smaller, index)                  
            ),
            Divider(),
            ListTile(
              title: Text('Quantity '+(camerasInCart[index].quantity).toString(),
                    style: style, textAlign: TextAlign.left),
              subtitle: Text('Total: \$'+(camerasInCart[index].totalPrice).toString(),
                    style: style, textAlign: TextAlign.left),
            )
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

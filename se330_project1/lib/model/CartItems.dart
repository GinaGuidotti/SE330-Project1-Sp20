import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/screens/cameraItemView.dart';
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
  String brand = "";
  String model = "";
  double basePrice = 0;
  String assetPath = "";
  String cameraInfo = "";
  int quantity = 0;
  double totalModificationPrice = 0.00;
  ColorChoice selectedColor;
  LensStyle selectedExtraLens;
  ProtectionPlan selectedPlan;
  ConfigPack selectedConfig;
  ExtraMemoryPack selectedMemoryPack;
  double totalPrice = 0;
  
  CartList(String a, String b, double c, String d, String e, int f, double g, 
  ColorChoice h, LensStyle i, ProtectionPlan j, ConfigPack k, ExtraMemoryPack l, double m){
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
    totalPrice = m;
  }

  CartList.addToCart(String a, String b, double c, String d, String e, int f, double g,
   ColorChoice h, LensStyle i, ProtectionPlan j, ConfigPack k, ExtraMemoryPack l, double m){
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
    totalPrice = m;
  }
}

class CartListBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontSize: screenWidth*0.06, color: Colors.black);  
    
    return ListView.builder(
      itemCount: camerasInCart.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Image.asset(camerasInCart[index].assetPath, width: 100, height: 100,),               
          subtitle: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    camerasInCart[index].brand + " - "+ camerasInCart[index].model,
                    style: style
                  ),
                ],
              ),
              Divider(height: 20, color: DarkCyan, thickness: 3.0,),
            ],
          ),
        );
      },
    );
     
  }
}

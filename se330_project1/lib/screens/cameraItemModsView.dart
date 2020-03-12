import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/modifications.dart';
import 'package:se330_project1/screens/Cart.dart';
import 'package:se330_project1/screens/cameraItemView.dart';
import 'package:se330_project1/main.dart';

 

class CameraModifications extends StatelessWidget {

  Future navigateToCart(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }
  Future navigateBackToCameraItem(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraItem()));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white); 

    final backToCameraInfo = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () { 
          navigateBackToCameraItem(context);
        },
        child: Icon(Icons.chevron_left, color: Colors.white, size: screenWidth*0.06),
      ),
    );
    
    final addToCartButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () { 
          navigateToCart(context);
        },
        child: Text('Add To Cart', style: whiteStyle)    
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold(  
        body: CameraModificationsBody(),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            backToCameraInfo,             
            addToCartButton,
          ],
        ),
      ),
    );
  }
}


class CameraModificationsBody extends StatelessWidget { 
  ModificationsDatabase theMods = new ModificationsDatabase();
  String selectedColor = " ";  
  String selectedLens = " ";
  String selectedProtPlan = " ";
  String selectedConfig = " ";
  String selectedMemory = " ";
  double totalModificationPrice = 0.00;
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle largeStyle = TextStyle(fontSize: screenWidth*0.07, color: DarkCyan); 
    TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: DarkCyan);   
    selectedColor = colorChoiceString[theMods.returnNumberColor()];
    selectedLens = lensStyleString[theMods.returnNumberLens()];
    selectedProtPlan = protectionPlanString[theMods.returnNumberProtectionPlan()];
    selectedConfig = configPackString[theMods.returnNumberConfig()];
    selectedMemory = extraMemoryPackString[theMods.returnNumberExtraCard()];

    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView( 
        children: <Widget>[
          Image.asset(theCameraList[chosenCameraNum].assetPath),
          Text(
            theCameraList[chosenCameraNum].brand + " - "+ theCameraList[chosenCameraNum].model,
            style: largeStyle
          ), 
          Divider(height: 20, color: Colors.grey,), 
          Row( //Colors
            children: <Widget>[
              Text('Colors', style: style),
              DropdownButton(
                value: selectedColor,
                onChanged: (String newValue) { 
                  
                  if(theMods.checkStringColor(newValue) == true){
                    selectedColor = newValue;
                    int intColor = theMods.returnNumberColor();
                    totalModificationPrice = totalModificationPrice + theMods.getColorPrice(intColor);
                  }
                  (context as Element).markNeedsBuild();
                },
                hint: Text("Color", style: style),
                items: colorChoiceString.map((String location) {
                  return new DropdownMenuItem<String>(
                    child: new Text(location),
                  );
               }).toList(), 
              ),
            ],
          ),
          Row(//Extra Lens Style
            children: <Widget>[
              Text('Additional Lens', style: style),
            ],
          ),
          Row(//Config Pack
            children: <Widget>[
              Text('Configuration Pack', style: style),
            ],
          ),
          Row(//Protection Plan
            children: <Widget>[
              Text('Protection Plan', style: style),

            ],
          ),
          Row(//Extra Memory Cards
            children: <Widget>[
              Text('Extra Memory Cards', style: style),
            ],
          ),
          SizedBox(height: screenWidth*0.1,),
        ],
      )
    );
     
  }
}
 
import 'package:flutter/material.dart';   
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/model/modifications.dart';
import 'package:se330_project1/screens/cameraItemModsView.dart';

class Cart extends StatefulWidget { 
  @override
  createState() => _CartPageState();
}

class _CartPageState extends State<Cart>{ 
 // double totalModificationPrice;
 // ColorChoice selectedColor;
 // LensStyle selectedExtraLens;
 // ProtectionPlan selectedPlan;
 // ConfigPack chosenselectedConfig;
 // ExtraMemoryPack selectedMemoryPack;

  @override
  Widget build(BuildContext context) {    
   double screenWidth = MediaQuery.of(context).size.width; 
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);
   return new MaterialApp( 
     debugShowCheckedModeBanner: false,  
     home: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: DarkCyan,
        ),
        drawer: CollapsingNavigationDrawer(),
        body: new Center(
          child: new ListView( 
            children: <Widget>[                
              SizedBox(height: screenWidth * 0.03),
              Text(
                'Just Clicked Cameras',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: (screenWidth * 0.07), 
                ),
              ),
              SizedBox(height: screenWidth * 0.1),
              ListTile(
                title: Text('Your Cart', style: italicTitle),
                subtitle: Text((
                  'Total: '+totalModificationPrice.toString()),
                  style: style),
              ),
              SizedBox(height: screenWidth * 0.02),
              Text('Color: '+selectedColor.name),
              Text('Lens: ' + selectedExtraLens.name),
              Text('Plan: ' + selectedPlan.name),
              Text('Memory Pack: ' + selectedMemoryPack.name),
              Text('Configuration: ' + selectedConfig.name), 
            ],
          ), 
        )
       )  
    );
  }
  

} 
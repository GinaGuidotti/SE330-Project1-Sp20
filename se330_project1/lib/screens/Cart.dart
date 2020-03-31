import 'package:flutter/material.dart';   
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/model/CartItems.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class Cart extends StatefulWidget { 
  @override
  createState() => _CartPageState();
}

class _CartPageState extends State<Cart>{ 
  @override
  Widget build(BuildContext context) {    
   //double screenWidth = MediaQuery.of(context).size.width; 
   //TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   //TextStyle italicTitle = TextStyle(fontSize: screenWidth*0.065, fontStyle: FontStyle.italic);  
   return new Scaffold( 
          backgroundColor: DarkCyan,

        drawer: CollapsingNavigationDrawer(),
        body: CartListHome(),
      );
  }
  
   /*return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(theCameraList[chosenCameraNum].assetPath, width: 100,height: 100),
             
              Text(
                    theCameraList[chosenCameraNum].brand + " - "+ theCameraList[chosenCameraNum].model,
                    style: style
                  ),
            ],
          ),               
          subtitle: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Quantity'),
                  Text('Total: \$'+(totalModificationPrice+theCameraList[chosenCameraNum].price).toString()),  
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Modifications:', textAlign: TextAlign.left),
                    Text('Color: '+selectedColor.name, textAlign: TextAlign.left),
                    Text('Lens: ' + selectedExtraLens.name, textAlign: TextAlign.left),
                    Text('Configuration: ' + selectedConfig.name, textAlign: TextAlign.left),
                    Text('Plan: ' + selectedPlan.name, textAlign: TextAlign.left),
                    Text('Memory Pack: ' + selectedMemoryPack.name, textAlign: TextAlign.left), 
                ],
              ),
              Divider(height: 20, color: DarkCyan, thickness: 3.0,),
            ],
          ),       
        );*/
   /*return new MaterialApp( 
     debugShowCheckedModeBanner: false,  
     home: Scaffold(
        drawer: CollapsingNavigationDrawer(),
        body: new Center(
          child: new ListView( 
            children: <Widget>[                
              SizedBox(height: screenWidth * 0.03),
              Text(
                'Just Clicked Cameras Cart',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: (screenWidth * 0.07), 
                ),
              ),
              ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Image.asset(theCameraList[chosenCameraNum].assetPath, width: 100,height: 100),
                    child: Text('Quantity'),
                    child: Text('Total: \$'+totalModificationPrice.toString()),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: const Center(child: Text('Entry B')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[100],
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              )
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                Column(
                  children: [
                    Image.asset(theCameraList[chosenCameraNum].assetPath, width: 100,height: 100),
                    Text('Quantity', textAlign: TextAlign.left),
                    Text('Total: \$'+totalModificationPrice.toString(), textAlign: TextAlign.left),
                  ],
                ),
                Column(
                  children: [
                    Text(theCameraList[chosenCameraNum].brand + ' '+ theCameraList[chosenCameraNum].model, style: italicTitle, textAlign: TextAlign.left),
                    Text('Modifications:', textAlign: TextAlign.left),
                    Text('Color: '+selectedColor.name, textAlign: TextAlign.left),
                    Text('Lens: ' + selectedExtraLens.name, textAlign: TextAlign.left),
                    Text('Configuration: ' + selectedConfig.name, textAlign: TextAlign.left),
                    Text('Plan: ' + selectedPlan.name, textAlign: TextAlign.left),
                    Text('Memory Pack: ' + selectedMemoryPack.name, textAlign: TextAlign.left), 
                  ],
                ),
              ]
              )
              
            ],
          ), 
        )
       )  
    );*/
  }
  

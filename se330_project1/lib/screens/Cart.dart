import 'package:flutter/material.dart';   
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/model/modifications.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/screens/cameraItemModsView.dart';
import 'package:se330_project1/main.dart';

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

  /* final paymentButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: DarkCyan,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () {
          print('All sent!');
          EmailDatabase theInfo = new EmailDatabase(userEmail, userComment);
          contactEmailSent = true;
          pastComments.add(theInfo);
          int num = pastComments.length - 1;
          contactEmailSent = true;
          print("Last Comment: \"" + pastComments[num].comment + "\" from email address: " + pastComments[num].email);
          (context as Element).markNeedsBuild();
        },
         
        child: contactEmailSent ? Text('Email Sent!', textAlign: TextAlign.center,) : Text('Continue to Payment', textAlign: TextAlign.center,) 
             
      ),
  );*/
  
   return ListTile(
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
          onTap: (){
          },
          
        );
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
  

} 
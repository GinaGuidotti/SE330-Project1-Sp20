import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/CartItems.dart';
import 'package:se330_project1/screens/cameraItemModsView.dart';
import 'package:se330_project1/screens/Cart.dart';
import 'package:se330_project1/main.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

class CameraItem extends StatelessWidget {

  Future navigateToModPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraModifications()));
  }

  Future navigateToCart(context) async {
    
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
    //this only pushes the body of the shopping scaffold to be cart
  }


  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white); 

    final modificationsButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.7, 
        //minWidth: screenWidth*0.5, //for with addToCartButton
        onPressed: () {
          insideCart = false; //used for header bar 
          navigateToModPage(context);
        },
        child: Text('Continue to Modifications', style: whiteStyle)    
      ),
    );
    
    final addToCartButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () {
          insideCart = true; //used for header bar 
           (context as Element).markNeedsBuild();   //To get it to rebuild the icon button  
          navigateToCart(context);          
          totalCartPrice = totalCartPrice + theCameraList[chosenCameraNum].price + totalModificationPrice;
          camerasInCart.add(CartList(theCameraList[chosenCameraNum].brand, theCameraList[chosenCameraNum].model,
           theCameraList[chosenCameraNum].price, theCameraList[chosenCameraNum].assetPath,
            theCameraList[chosenCameraNum].cameraInfo, 1, totalModificationPrice, selectedColor, 
            selectedExtraLens, selectedPlan, selectedConfig, selectedMemoryPack,));
        },
        child: Text('Add To Cart', style: whiteStyle)    
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold( 
        appBar: AppBar(
          backgroundColor: DarkCyan,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[               
              Text('Camera Information '),  
            ],
          ),
        ),
        drawer: CollapsingNavigationDrawer(),
        body: CameraItemBody(),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            modificationsButton,             
            //addToCartButton,
          ],
        ),
      ),
    );
  }
}


class CameraItemBody extends StatelessWidget { 
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //TextStyle largeStyle = TextStyle(fontSize: screenWidth*0.07, color: DarkCyan); 
    TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: DarkCyan);   
    
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: ListView( 
        children: <Widget>[
          Image.asset(theCameraList[chosenCameraNum].assetPath),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    theCameraList[chosenCameraNum].brand + " - "+ theCameraList[chosenCameraNum].model,
                    style: style
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: theCameraList[chosenCameraNum].favorite ? DarkCyan : Colors.grey,
                    ), 
                    onPressed: (){    
                      theCameraList[chosenCameraNum].clickedFavoriteButton();
                      (context as Element).markNeedsBuild(); //To get it to rebuild the icon button 
                    }
                  ), 
                  IconButton(
                    icon: Icon(Icons.message), 
                    onPressed: (){
                      //Go to review Page
                    }
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.bookmark, 
                      color: theCameraList[chosenCameraNum].saved ? DarkCyan : Colors.grey,
                    ), 
                    onPressed: (){ 
                      theCameraList[chosenCameraNum].clickedSavedButton();   
                      (context as Element).markNeedsBuild();   //To get it to rebuild the icon button            
                    }
                  ),

                ],
              ),
              Divider(height: 20, color: DarkCyan, thickness: 3.0,),
            ],
          ),
          Container(
            child: Text(
              theCameraList[chosenCameraNum].cameraInfo,
              style: style
            ),
          ), 
          SizedBox(height: screenWidth*0.1,),
        ],
      )
    );
     
  }
}
 
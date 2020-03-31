import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/screens/cameraItemModsView.dart';
import 'package:se330_project1/screens/Cart.dart';
import 'package:se330_project1/main.dart';

class CameraItem extends StatelessWidget {

  Future navigateToModPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraModifications()));
  }

  Future navigateToCart(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
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
        minWidth: screenWidth*0.5, 
        onPressed: () {
          print('MODIFICATIONS!'); 
          navigateToModPage(context);
        },
        child: Text('Modifications', style: whiteStyle)    
      ),
    );
    
    final addToCartButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () {
          print('ADDING TO CART!'); 
          navigateToCart(context);
        },
        child: Text('Add To Cart', style: whiteStyle)    
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold( 
        // This does not look nice at all and it makes me sad. Otherwise it works perfectly fine
        // it just does not blend well with the current app bar thats already there... this is a future fix
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(screenHeight*0.05),
        //   child: AppBar( 
        //     leading: IconButton(
        //       onPressed: (){
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(
        //         Icons.chevron_left,
        //       )
        //     ), 
        //     title: Text(
        //       theCameraList[chosenCameraNum].brand + " - " + theCameraList[chosenCameraNum].model
        //     ),
        //     backgroundColor: DarkCyan,
        //   ),
        // ),
        body: CameraItemBody(),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            modificationsButton,             
            addToCartButton,
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
 
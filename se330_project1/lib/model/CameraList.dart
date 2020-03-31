import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/screens/cameraItemView.dart';
//import 'package:carousel_slider/carousel_slider.dart'; //Possible Idea
import 'package:se330_project1/main.dart';
import 'package:se330_project1/screens/searchCameras.dart';
import 'package:se330_project1/screens/Cart.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';

int chosenCameraNum;

class CameraListHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold( 
        body: CameraListBody(),
      ),
    );
  }
}


class CameraListBody extends StatelessWidget {
 
  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraItem()));
  }

  Future navigateToCart(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart())); 
  }
  //to see if the cart is empty or not
  bool cartEmpty = camerasInCart.isEmpty;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontSize: screenWidth*0.06, color: Colors.black);  
    insideCart = false; //used for header bar
     
     return Scaffold(     
      appBar: AppBar(
          backgroundColor: DarkCyan,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[               
              Text('Our Cameras'), 
              IconButton(
                color: Colors.white,
                disabledColor: DarkCyan,
                icon: Icon(Icons.shopping_cart),
                onPressed: cartEmpty ? null : (){
                  navigateToCart(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.search), 
                onPressed: (){ 
                  showSearch(context: context, delegate: Search());
                }
              ),
            ],
          ),
        ),
    drawer: CollapsingNavigationDrawer(),
    body: ListView.builder(
      itemCount: theCameraList.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Image.asset(theCameraList[index].assetPath),               
          subtitle: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    theCameraList[index].brand + " - "+ theCameraList[index].model,
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
                      color: theCameraList[index].favorite ? DarkCyan : Colors.grey,
                    ), 
                    onPressed: (){      
                      theCameraList[index].clickedFavoriteButton();
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
                      color: theCameraList[index].saved ? DarkCyan : Colors.grey,
                    ), 
                    onPressed: (){ 
                      theCameraList[index].clickedSavedButton();   
                      (context as Element).markNeedsBuild();   //To get it to rebuild the icon button            
                    }
                  ),

                ],
              ),
              Divider(height: 20, color: DarkCyan, thickness: 3.0,),
            ],
          ),
          onTap: (){
            print(theCameraList[index].model);
            chosenCameraNum = index;
            navigateToSubPage(context);
          },
        );
      },
    ),
    );
     
  }
}

class Cameras{
  String brand = "";
  String model = "";
  double price = 0;
  String assetPath = "";
  String cameraInfo = "";

  bool favorite = false;
  bool saved = false;
  String review;

  Cameras(String b, String m, double p, String ap, String cInfo){
    brand = b;
    model = m;
    price = p;
    assetPath = ap;
    cameraInfo = cInfo;
  }
   
  void clickedFavoriteButton(){
    favorite = !favorite;
  }

  void clickedSavedButton(){
    saved = !saved;
  }
}
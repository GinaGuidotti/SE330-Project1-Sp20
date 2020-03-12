import 'package:flutter/material.dart';  
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/screens/cameraItemModsView.dart';
import 'package:se330_project1/screens/Cart.dart';
import 'package:se330_project1/main.dart';

class Favorites extends StatefulWidget { 
  @override
  createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<Favorites>{ 

  Widget build(BuildContext context) {    
     
   return new Scaffold( 
        appBar: AppBar(
          backgroundColor: DarkCyan,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[               
              Text('Your Favorites'),
              IconButton(
                icon: Icon(Icons.search), 
                onPressed: (){
                  print('FUTURE SEARCH!');
                }
              ),
            ],
          ),
        ),
        drawer: CollapsingNavigationDrawer(),
        body: FavoriteCameraItem(),
      );
  }

} 

int chosenFavNum;

class FavoriteCameraItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold( 
        body: FavoriteCameraItemBody(),
      ),
    );
  }
}


class FavoriteCameraItemBody extends StatelessWidget {
 
  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteCameraItem()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontSize: screenWidth*0.06, color: Colors.black);  
    
    
    return ListView.builder(
      itemCount: theCameraList.length,
      itemBuilder: (context, index){
        if(theCameraList[index].favorite == true){ 
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
                Divider(height: 20, color: Colors.grey,),
              ],
            ),
            onTap: (){
              print(theCameraList[index].model);
              chosenCameraNum = index;
              navigateToSubPage(context);
            },
          );
        }
        else{
          return ListTile( 
            isThreeLine: false,
          );
        }
      },
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

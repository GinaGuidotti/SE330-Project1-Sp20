import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';   
//import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/main.dart'; 
import 'package:se330_project1/screens/cameraItemView.dart';
 

class Search extends SearchDelegate<String>{ 
  
  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraItem()));
  }

  Cameras chosenCamera = theCameraList[0]; 
  int chosenSearchNum = 0; 

  @override
  List<Widget> buildActions(BuildContext context) {
      // Actions for app bar
      return [
        IconButton(icon: Icon(Icons.clear), onPressed: (){
          query = "";
         },)
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Leading icon on the left of the app bar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
           ),
        onPressed: ()
        { 
          close(context, null);
        }  
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {          
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;      
      TextStyle style = TextStyle(fontSize: screenWidth*0.06, color: Colors.black);  
      //show some results based on the selection
      print('Print Me Some Cameras!' );
      return ListView.builder(
        itemCount: theCameraList.length,
        itemBuilder: (context, index){
          print('TESTING: Camera is now ' + theCameraList[index].brand + "-"+ theCameraList[index].model + " at " + index.toString());
          if(theCameraList[index].model.contains(query) || theCameraList[index].brand.contains(query)){ 
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
                chosenSearchNum = index;
                navigateToSubPage(context);
              },
            );
          }else{
            return ListTile();
          }
        }
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    //TheCameraList is list of Cameras   

    final suggestionList = query.isEmpty ? recentCameras:theCameraList.where((str)=>str.model.startsWith(query) || str.brand.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: (){
            if(theCameraList.contains(query)){
              chosenCamera = theCameraList[index];
              for(int i = 0; i < theCameraList.length; i++){
                if(theCameraList[i].brand == query || theCameraList[i].model == query){
                  chosenSearchNum = index;
                }
              }  
            }
            showResults(context); 
          },
          leading: Icon(Icons.camera_alt),
          title: RichText(text: 
            TextSpan(
              text: (suggestionList[index].brand + " " + suggestionList[index].model).substring(0, query.length),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: (suggestionList[index].brand + " " + suggestionList[index].model).substring(query.length),
                  style: TextStyle(color: Colors.grey),
               ),
              ]
            ),

          ),
        ),
      itemCount: suggestionList.length,


      );

  }
   

}
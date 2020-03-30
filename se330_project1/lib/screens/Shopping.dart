import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';   
import 'package:se330_project1/navigation/custom_navigation_drawer.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/main.dart';

class Shopping extends StatefulWidget { 
  @override
  createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<Shopping>{ 
   Widget build(BuildContext context) {     
   return new Scaffold( 
        appBar: AppBar(
          backgroundColor: DarkCyan,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[               
              Text('Our Cameras'),
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
        body: CameraListHome(),
      );
  }

} 

class Search extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
      // Actions for app bar
      return [
        IconButton(icon: Icon(Icons.clear), onPressed: (){ },)
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
        { }  
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      //show some results based on the selection
      
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    //TheCameraList is list of Cameras 
    int totalCameras = theCameraList.length;

  }
   

}
import 'package:flutter/material.dart'; 
import 'package:se330_project1/globalvariables.dart';  
import 'package:flutter_bloc/flutter_bloc.dart';  
import 'dart:convert'; 
import 'package:se330_project1/screens/home.dart'; 
import 'package:se330_project1/navigation/custom_navigation_drawer.dart'; 
import 'package:se330_project1/model/CameraList.dart';

void main(){ 
  runApp(
    MyApp( )
  );
}

List<Cameras> theCameraList = new List<Cameras>();

class MyApp extends StatelessWidget{

  @override
  Widget build( BuildContext context){     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Clicked Cameras Main UI',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: DarkCyan, 
          ),
      home: MyMainPage(),
      );    
  }
}

class MyMainPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    theCameraList = new List<Cameras>(); //Erase all previous items in it

    theCameraList.add(
      new Cameras(
        "Canon", 
        "EOS 2000D Rebel T7", 
        299.99, 
        "assets/CanonRebelT7.gif",
        "Ideal for mobile device users wanting to take the next step with their photography, "
        +"the EOS Rebel T7 camera combines fantastic features with easy-to-use operation for "
        +"high-quality images you'll be proud to share. Harness the power of the EOS Rebel T7's "
        +"large 24.1 Megapixel CMOS sensor to realize your potential for great shots. "
        +"Share the memories with your friends and family quickly and easily via built-in "
        +"Wi-Fi®* and NFC** technology. With the EOS Rebel T7's fast autofocus system, you "
        +"can capture every moment as it happens, viewing each shot through the bright optical"
        +" viewfinder. A range of additional features, including a large LCD screen, Full HD video "
        +"recording and an on-board feature guide help you capture eye-catching photos and video."
        )
      );
    theCameraList.add(
      new Cameras(
        "Canon", 
        "EOS C200 EF CINEMA", 
        6499.00, 
        "assets/CanonC200EF.jpg",
        "The EOS C200 Digital Cinema Camera is a \"ready-to-go\" production camera that comes with "
        +"a built-in electronic viewfinder and an array of accessories including a 4-inch touch screen"
        +" LCD monitor, a versatile handle and ergonomic handgrip. The camera can record internal 4K RAW "
        +"to a CFast™ 2.0 card in our new Cinema RAW Light format without compromising detail, as well as 4K "
        +"UHD and Full HD in MP4 format to SD cards. The 8.85 Megapixel Super 35mm CMOS sensor, 13 stops of dynamic"
        +" range, Dual Pixel CMOS AF, full compatibility with Canon EF-mount lenses, and HDR capability help make the "
        +"EOS C200 ideal for film, documentary and television production, corporate and event videography, and newsgathering. "
        +"The camera's multitude of features helps deliver outstanding image quality, performance and versatility" 
        )
      );
    theCameraList.add(
      new Cameras(
        "Nikon", 
        "D5 DSLR", 
        4429.00, 
        "assets/NikonD5.jpg",
        "What determines when Nikon releases a full-frame flagship camera? When technological innovation demands it. Introducing the D5,"
        +" an FX-format DSLR that makes the impossible possible. Huge advancements in sensor design, autofocus, metering and image processing"
        +" result in thrilling new capabilities—low light shooting all the way to ISO 102,400 (expandable to an unheard of ISO 3,280,000), "
        +"precise AF detection and tracking across that entire ISO range, regardless of your subject's speed or direction changes, blazing fast "
        +"12 fps continuous shooting, 4K UHD video and, of course, image quality that captures the hearts and minds of your viewers. This is not "
        +"iteration, friends. This is innovation...spectacular innovation. How will it change the way you shoot?"
        )
      );
    theCameraList.add(
      new Cameras(
        "Nikon",  
        "D3500 DSLR", 
        388.00, 
        "assets/NikonD3500.jpg",
        "You don't need to be a photographer to know a great photo when you see one. And you don't need to be a photographer to take a great "
        +"photo—you just need the D3500. It's as easy to use as a point-and-shoot, but it takes beautiful DSLR photos and videos that get noticed. "
        +"It feels outstanding in your hands, sturdy and balanced with controls where you want them. It's compact, durable and versatile, ideal for"
        +" travel. And it works seamlessly with compatible smartphones, making it easier than ever to share your great photos. Even if you've never"
        +" picked up a DSLR camera, you can take beautiful pictures with D3500."
        )
      );
    
   double screenWidth = MediaQuery.of(context).size.width;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
    return Scaffold(
      appBar: AppBar(
        title: Text('Just Clicked Cameras'),
      ),
      drawer: CollapsingNavigationDrawer(),
      body: Column(
        children: <Widget>[
          Text('This is the Main Page'),
          
        ],
      ),

    );
  }
   
}

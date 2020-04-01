import 'package:flutter/material.dart'; 
import 'package:se330_project1/globalvariables.dart';  
//import 'package:flutter_bloc/flutter_bloc.dart';  
//import 'dart:convert'; 
import 'package:se330_project1/screens/home.dart'; 
//import 'package:se330_project1/navigation/custom_navigation_drawer.dart'; 
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/CartItems.dart';  
import 'package:se330_project1/screens/AccountCreation.dart';

void main(){ 
  runApp(
    MyApp( )
  );
}

List<Cameras> theCameraList = new List<Cameras>();
List<Cameras> recentCameras = new List<Cameras>();
List<CartList> camerasInCart = new List<CartList>();
double totalCartPrice = 0.0;
bool insideCart = false; //might get rid of this later

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
  String username, password;

  Future navigateToHome(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  } 
  Future navigateToAccountCreation(context) async {
    print('Future Implementation');
    //Navigator.push(context, MaterialPageRoute(builder: (context) => AccountCreation()));
  }

  @override  
  Widget build(BuildContext context){
    
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: Colors.black);  
   TextStyle bigStyle = TextStyle(fontSize: screenWidth*0.07, color: Colors.black);  


    final userNameField = TextField(
      onChanged: (String value){ 
        username = value;
      }, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passWordField = TextField(
      onChanged: (String value){ 
        password = value;
      }, 
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginAsGuestButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: DarkCyan,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.9,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () { 
          //(context as Element).markNeedsBuild();
          navigateToHome(context);
        },         
        child: Text('Login As Guest', style: style, textAlign: TextAlign.center,)              
      ),
    );

    final loginAsUserButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: DarkCyan,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.9,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () { 
          //(context as Element).markNeedsBuild();
          navigateToHome(context);
        },         
        child: Text('Login to Account', style: style, textAlign: TextAlign.center,)              
      ),
    );

    final createAccountButton = Material(
      //elevation: 5.0,
      //borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.9,
        //padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), 
        onPressed: () { 
          //(context as Element).markNeedsBuild();
          navigateToAccountCreation(context);
        },         
        child: Text('Create Account', style: style, textAlign: TextAlign.center,)              
      ),
    );

    theCameraList = new List<Cameras>(); //Erase all previous items in it
    recentCameras = new List<Cameras>();

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
    recentCameras.add(theCameraList[0]); //Just to have at least one in there for search
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Just Clicked Cameras - Login'),
      ),
      //drawer: CollapsingNavigationDrawer(),
      body: Column(
        children: <Widget>[
          SizedBox(height: screenWidth*0.10,),
          SizedBox(height: screenHeight*0.2, child: Image.asset('assets/JCClogo.jpg')),
          Text('Just Clicked Cameras', style: bigStyle),
          SizedBox(height: screenWidth*0.05,),
          userNameField,
          SizedBox(height: screenWidth*0.02,),
          passWordField,
          SizedBox(height: screenWidth*0.05,),
          loginAsUserButton,
          SizedBox(height: screenWidth*0.05,),
          loginAsGuestButton,
          // Divider(thickness: 2.0, color: DarkCyan, height: 20),
          SizedBox(height: screenWidth*0.05,),
          createAccountButton

          
        ],
      ),

    );
  }
   
}

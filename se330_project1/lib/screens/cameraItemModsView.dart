import 'package:flutter/material.dart';
import 'package:se330_project1/globalvariables.dart';
import 'package:se330_project1/model/CameraList.dart';
import 'package:se330_project1/model/modifications.dart';
import 'package:se330_project1/screens/Cart.dart';
import 'package:se330_project1/screens/cameraItemView.dart';
import 'package:se330_project1/main.dart';

class CameraModifications extends StatefulWidget{
  
  @override
  CameraModificationState createState() => CameraModificationState();
} 

double totalModificationPrice = 0.00;

class CameraModificationState extends State<CameraModifications> {
  List<ColorChoice> theModColors = ColorChoice.getColorChoices(); 
  List<DropdownMenuItem<ColorChoice>> dropdownColorItems;
  ColorChoice selectedColor;

  List<LensStyle> theModLens = LensStyle.getLensStyles();
  List<DropdownMenuItem<LensStyle>> dropdownLensItems;
  LensStyle selectedExtraLens;

  List<ProtectionPlan> theModPlans = ProtectionPlan.getPlans();
  List<DropdownMenuItem<ProtectionPlan>> dropdownProtPlanItems;
  ProtectionPlan selectedPlan;

  List<ConfigPack> theModConfigs = ConfigPack.getConfigPacks();
  List<DropdownMenuItem<ConfigPack>> dropdownConfigItems;
  ConfigPack selectedConfig;

  List<ExtraMemoryPack> theModCards = ExtraMemoryPack.getMemoryCards();
  List<DropdownMenuItem<ExtraMemoryPack>> dropdownMemoryItems;
  ExtraMemoryPack selectedMemoryPack;

  double colorPrice = 0;
  double lensPrice = 0;
  double configPrice = 0;
  double memCardPrice = 0;
  double protPlanPrice = 0;

  Future navigateToCart(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }
  Future navigateBackToCameraItem(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraItem()));
  }

  @override
  void initState(){
    dropdownColorItems = buildDropdownColorItems(theModColors);
    selectedColor = dropdownColorItems[0].value;
    dropdownConfigItems = buildDropdownConfigItems(theModConfigs);
    selectedConfig = dropdownConfigItems[0].value;
    dropdownLensItems = buildDropdownLensItems(theModLens);
    selectedExtraLens = dropdownLensItems[0].value;
    dropdownProtPlanItems = buildDropdownPlanItems(theModPlans);
    selectedPlan = dropdownProtPlanItems[0].value;
    dropdownMemoryItems = buildDropdownMemPackItems(theModCards);
    selectedMemoryPack = dropdownMemoryItems[0].value;
    totalModificationPrice = 0.00;
    colorPrice = 0;
    lensPrice = 0;
    configPrice = 0;
    memCardPrice = 0;
    protPlanPrice = 0;
    super.initState();
  }

  List<DropdownMenuItem<ColorChoice>> buildDropdownColorItems(List colors) {
    List<DropdownMenuItem<ColorChoice>> items = List();
    for (ColorChoice color in colors) {
      items.add(
        DropdownMenuItem(
          value: color,
          child: Text(color.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<LensStyle>> buildDropdownLensItems(List lens) {
    List<DropdownMenuItem<LensStyle>> items = List();
    for (LensStyle len in lens) {
      items.add(
        DropdownMenuItem(
          value: len,
          child: Text(len.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ProtectionPlan>> buildDropdownPlanItems(List plans) {
    List<DropdownMenuItem<ProtectionPlan>> items = List();
    for (ProtectionPlan plan in plans) {
      items.add(
        DropdownMenuItem(
          value: plan,
          child: Text(plan.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ConfigPack>> buildDropdownConfigItems(List packs) {
    List<DropdownMenuItem<ConfigPack>> items = List();
    for (ConfigPack pack in packs) {
      items.add(
        DropdownMenuItem(
          value: pack,
          child: Text(pack.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ExtraMemoryPack>> buildDropdownMemPackItems(List mems) {
    List<DropdownMenuItem<ExtraMemoryPack>> items = List();
    for (ExtraMemoryPack mem in mems) {
      items.add(
        DropdownMenuItem(
          value: mem,
          child: Text(mem.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownColor(ColorChoice theColor){
    setState(() {
      selectedColor = theColor;
      colorPrice = theColor.price;
    });
  }
  onChangeDropdownLens(LensStyle theLens){
    setState(() {
      selectedExtraLens = theLens;
      lensPrice = theLens.price;
    });
  }
  onChangeDropdownProtPlan(ProtectionPlan thePlan){
    setState(() {
      selectedPlan = thePlan;
      protPlanPrice = thePlan.price;
    });
  }
  onChangeDropdownConfigPack(ConfigPack thePack){
    setState(() {
      selectedConfig = thePack;
      configPrice = thePack.price;
    });
  }
  onChangeDropdownMemoryPack(ExtraMemoryPack thePack){
    setState(() {
      selectedMemoryPack = thePack;
      memCardPrice = thePack.price; 
    });
  }

  double calculateModPrice(){
    totalModificationPrice = colorPrice + lensPrice + configPrice + memCardPrice + protPlanPrice;
    return totalModificationPrice;
  }

  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle whiteStyle = TextStyle(fontSize: screenWidth*0.06, color: Colors.white); 
    TextStyle largeStyle = TextStyle(fontSize: screenWidth*0.07, color: DarkCyan); 
    TextStyle style = TextStyle(fontSize: screenWidth*0.05, color: DarkCyan);   
     

    final backToCameraInfo = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () { 
          navigateBackToCameraItem(context);
        },
        child: Icon(Icons.chevron_left, color: Colors.white, size: screenWidth*0.06),
      ),
    );
    
    final addToCartButton = Material(
      elevation: 5.0, 
      color: DarkCyan,
      child: MaterialButton(
        minWidth: screenWidth*0.5, 
        onPressed: () { 
          navigateToCart(context);
        },
        child: Text('Add To Cart', style: whiteStyle)    
      ),
    );

    final priceField = Text( 
      "Current Modification Price: \$" + calculateModPrice().toStringAsFixed(2),
      style: style,
      textAlign: TextAlign.center,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      home: Scaffold(  
        backgroundColor: DarkCyan,
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: ListView( 
            children: <Widget>[
              Image.asset(theCameraList[chosenCameraNum].assetPath),
              Text(
                theCameraList[chosenCameraNum].brand + " - "+ theCameraList[chosenCameraNum].model,
                style: largeStyle
              ), 
              Divider(height: 20, color: Colors.grey,),
              priceField,
              Divider(height: 20, color: Colors.grey,),                
              Text('Colors', style: style),
              DropdownButton( 
                value: selectedColor,
                items: dropdownColorItems,
                onChanged: (ColorChoice changedColor) {
                  onChangeDropdownColor(changedColor);
                  (context as Element).markNeedsBuild();
                }
              ), 
              Text('Additional Lens', style: style),
              DropdownButton( 
                value: selectedExtraLens,
                items: dropdownLensItems,
                onChanged: (LensStyle changedLens){
                  onChangeDropdownLens(changedLens);
                  (context as Element).markNeedsBuild(); 
                }
              ), 
              Text('Configuration Pack', style: style),
              DropdownButton( 
                value: selectedConfig,
                items: dropdownConfigItems,
                onChanged: (ConfigPack changedConfig){
                  onChangeDropdownConfigPack(changedConfig);
                  (context as Element).markNeedsBuild();
                }
              ), 
              Text('Protection Plan', style: style),
              DropdownButton( 
                value: selectedPlan,
                items: dropdownProtPlanItems,
                onChanged: (ProtectionPlan changedPlan){
                  onChangeDropdownProtPlan(changedPlan);
                   (context as Element).markNeedsBuild();
                }
              ), 
              Text('Extra Memory Cards', style: style),
              DropdownButton( 
                value: selectedMemoryPack,
                items: dropdownMemoryItems,
                onChanged: (ExtraMemoryPack changedPack){
                  onChangeDropdownMemoryPack(changedPack); 
                  (context as Element).markNeedsBuild();
                }
              ),
              SizedBox(height: screenWidth*0.1,),
            ],
          )
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            backToCameraInfo,             
            addToCartButton,
          ],
        ),
      ),
    );
  }
}


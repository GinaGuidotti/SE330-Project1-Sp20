// import 'package:flutter/material.dart';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';

enum ColorChoice{
  black,    //0
}

enum LensStyle{
  no_Extra,           //0
  lens18_55mm,    //1
  lens18_140mm,   //2
  lens70_300mm,   //3
}
enum ConfigPack{
  basePack,                   //0
  basePlusAdobeCreativeCloud, //1
}
enum ProtectionPlan{
  no_Plan,                 //0
  twoYearsProtection,   //1
  threeYearsProtection, //2
}
enum ExtraMemoryPack{
  basePack,             //0
  basePlusSanDisk32GB,  //1
  basePlusSanDisk64GB,  //2
}


List<String> colorChoiceString = ["black"];    

List<String> lensStyleString = [
  "No Extra Lens",           //0
  "18-55mm",    //1
  "18-140mm",   //2
  "70-300mm",   //3
];

List<String> configPackString = [
  "Base Pack",                   //0
  "Base + Adobe Creative Cloud", //1
];

List<String> protectionPlanString = [
  "No Extra Plan",                 //0
  "Two Year Plan",   //1
  "Three Year Plan", //2
];

List<String> extraMemoryPackString = [
  "No Extra Memory",             //0
  "SanDisk 32GB",  //1
  "SanDisk 64GB",  //2
];


class ModificationsDatabase {
  ColorChoice theColorChoice = ColorChoice.black;
  LensStyle theLensChoice = LensStyle.no_Extra;  
  ConfigPack theConfigPack = ConfigPack.basePack;
  ProtectionPlan theProtectionPlan = ProtectionPlan.no_Plan;
  ExtraMemoryPack theMemoryChoice = ExtraMemoryPack.basePack;

  ModificationsDatabase();
  void setAllData(int colorChoice, int lensChoice, int confChoice, int protChoice, int memoryChoice){
    if(colorChoice == 0){
      theColorChoice = ColorChoice.black;
    }else{
      theColorChoice = ColorChoice.black;      
    }   
    
    if(lensChoice == 1){
      theLensChoice = LensStyle.lens18_55mm;
    }else if(lensChoice == 2){
      theLensChoice = LensStyle.lens18_140mm;
    }else if(lensChoice == 3){
      theLensChoice = LensStyle.lens70_300mm;
    }else{
      theLensChoice = LensStyle.no_Extra;
    }
 
    if(confChoice == 1){
      theConfigPack = ConfigPack.basePack;
    }else{
      theConfigPack = ConfigPack.basePlusAdobeCreativeCloud;
    }

    if(protChoice == 1){
      theProtectionPlan = ProtectionPlan.twoYearsProtection;
    }else if(protChoice == 2){
      theProtectionPlan = ProtectionPlan.threeYearsProtection; 
    }else{
      theProtectionPlan = ProtectionPlan.no_Plan;
    }

    if(memoryChoice == 1){
      theMemoryChoice = ExtraMemoryPack.basePlusSanDisk32GB;
    }else if(memoryChoice == 2){
      theMemoryChoice = ExtraMemoryPack.basePlusSanDisk64GB; 
    }else{
      theMemoryChoice = ExtraMemoryPack.basePack;
    }

  }
  double getColorPrice(int enumVal){
    double price = 0;
    if(enumVal == 0){
      price = 0.00; //Black
    }
    return price;
  }
  double getExtraLensPrice(int enumVal){
    double price = 0;
    if(enumVal == 1){
      price = 59.99; //18-55mm
    }else if(enumVal == 2){
      price = 50.95; //18-140mm
    }else if(enumVal == 3){
      price = 51.86; //70-300mm
    }else{
      price = 0; //None
    }
    return price;
  }
  double getConfigPackPrice(int enumVal){
    double price = 0;
    if(enumVal == 1){
      price = 118.88; //Base+Adobe
    }else{
      price = 0; //Base Pack
    }
    return price;
  }
  double getProtectPlanPrice(int enumVal){
    double price = 0;
    if(enumVal == 1){
      price = 24.99; //2 Years
    }else if(enumVal == 2){
      price = 33.99; //3 Years
    }else{
      price = 0;
    }
    return price;
  }
  double getExtraMemoryPrice(int enumVal){
    double price = 0;
    if(enumVal == 1){
      price = 5.75; //Base+32GB
    }else if(enumVal == 2){
      price = 11.49; //Base+64GB
    }else{
      price = 0.00; 
    }
    return price;
  }

  int returnNumberColor(){
    int returnNum = 0;
    if(theColorChoice == ColorChoice.black){
      returnNum = 0;
    }
    return returnNum;
  }

  int returnNumberLens(){
    int returnNum = 0;
    if(theLensChoice == LensStyle.lens18_55mm){
      returnNum = 1;
    }else if(theLensChoice == LensStyle.lens18_140mm){
      returnNum = 2;
    }else if(theLensChoice == LensStyle.lens70_300mm){
      returnNum = 3;
    }else{
      returnNum = 0;
    }
    return returnNum;
  }

  int returnNumberConfig(){
    int returnNum = 0;
    if(theConfigPack == ConfigPack.basePlusAdobeCreativeCloud){
      returnNum = 1;
    }else{
      returnNum = 0;
    }
    return returnNum;
  }

  int returnNumberProtectionPlan(){
    int returnNum = 0;
    if(theProtectionPlan == ProtectionPlan.twoYearsProtection){
      returnNum = 1;
    }else if(theProtectionPlan == ProtectionPlan.threeYearsProtection){
      returnNum = 2;
    }else{
      returnNum = 0;
    }
    return returnNum;
  }

  int returnNumberExtraCard(){
    int returnNum = 0;
    if(theMemoryChoice == ExtraMemoryPack.basePlusSanDisk32GB){
      returnNum = 1;
    }else if(theMemoryChoice == ExtraMemoryPack.basePlusSanDisk64GB){
      returnNum = 2;
    }else{
      returnNum = 0;
    }
    return returnNum;
  }

  bool checkStringColor(String theName){
    bool foundVal = false;
    for(int i = 0; i < colorChoiceString.length; i++){
      if(colorChoiceString[i] == theName){
        foundVal = true;
      }
    }
    return foundVal; 
  }

} 

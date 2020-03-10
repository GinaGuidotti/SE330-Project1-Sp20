import 'package:flutter/material.dart';

enum ColorChoice{
  black,    //0
}
enum LensStyle{
  none,           //0
  lens18_55mm,    //1
  lens18_140mm,   //2
  lens70_300mm,   //3
}
enum ConfigPack{
  basePack,                   //0
  basePlusAdobeCreativeCloud, //1
}
enum ProtectionPlan{
  none,                 //0
  twoYearsProtection,   //1
  threeYearsProtection, //2
}
enum ExtraMemoryPack{
  basePack,             //0
  basePlusSanDisk32GB,  //1
  basePlusSanDisk64GB,  //2
}



class ModificationsDatabase {
  ColorChoice theColorChoice = ColorChoice.black;
  LensStyle theLensChoice = LensStyle.none;  
  ConfigPack theConfigPack = ConfigPack.basePack;
  ProtectionPlan theProtectionPlan = ProtectionPlan.none;
  ExtraMemoryPack theMemoryChoice = ExtraMemoryPack.basePack;

  ModificationsDatabase({this.theColorChoice, this.theLensChoice, this.theConfigPack, this.theProtectionPlan, this.theMemoryChoice});
 
} 
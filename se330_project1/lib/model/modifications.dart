// import 'package:flutter/material.dart';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class ColorChoice{
  double price;
  String name;

  ColorChoice(this.price, this.name);

  static List<ColorChoice> getColorChoices(){
    return <ColorChoice>[
      ColorChoice(0.00, 'Black'),
    ];
  } 
}

class LensStyle{
  double price;
  String name;

  LensStyle(this.price, this.name);

  static List<LensStyle> getLensStyles(){
    return <LensStyle>[
      LensStyle(0.00 , 'No Extra Lens' ),
      LensStyle(59.99 , '18-55mm' ),
      LensStyle(50.95 , '18-140mm' ),
      LensStyle(51.86 , '70-300mm' ),
    ];
  }
}

class ConfigPack{
  double price;
  String name;

  ConfigPack(this.price, this.name);

  static List<ConfigPack> getConfigPacks(){
    return <ConfigPack>[
      ConfigPack(0.00 , 'Base Configuration Pack' ),
      ConfigPack(118.88 , 'Base + Adobe Creative Cloud' ), 
    ];
  }
}


class ProtectionPlan{
  double price;
  String name;

  ProtectionPlan(this.price, this.name);

  static List<ProtectionPlan> getPlans(){
    return <ProtectionPlan>[
      ProtectionPlan(0.00 , 'No Extra Plan' ),
      ProtectionPlan(24.99, 'Two Year Plan' ), 
      ProtectionPlan(33.99, 'Three Year Plan' ),
    ];
  }
}
 
 class ExtraMemoryPack{
  double price;
  String name;

  ExtraMemoryPack(this.price, this.name);

  static List<ExtraMemoryPack> getMemoryCards(){
    return <ExtraMemoryPack>[
      ExtraMemoryPack(0.00 , 'Base Card' ),
      ExtraMemoryPack(5.75, 'Base + SanDisk 32GB' ), 
      ExtraMemoryPack(11.49, 'Base + SanDIsk 64GB' ),
    ];
  }
} 

 

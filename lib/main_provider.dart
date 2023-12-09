import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainProvider with ChangeNotifier {

  Box box = Hive.box('data');
  List<String> buttonImages = ['circle', 'square', 'rect'];
  int topSelectedButton = 0;
  int bottomSelectedButton = 0;
  int lt = 8;
  int rt = 8;
  int ld = 8;
  int rd = 8;
  String coefficient = '0';
  String mass = '0000';
  String result = '0';

  void getData(){
    topSelectedButton = box.get('top') ?? 0;
    bottomSelectedButton = box.get('bottom') ?? 0;
    lt = box.get('lt') ?? 8;
    rt = box.get('rt') ?? 8;
    ld = box.get('ld') ?? 8;
    rd = box.get('rd') ?? 8;
    mass = box.get('mass') ?? '0000';
  }

  void calculate(){
    result = (double.parse(mass) * double.parse(coefficient)).toStringAsFixed(1);
    // notifyListeners();
  }

  void setCoefficient(){
    if(topSelectedButton == 0 && bottomSelectedButton == 0){
      coefficient = ((ld * ld) / (lt * lt)).toStringAsFixed(4);
    }else if(topSelectedButton == 0 && bottomSelectedButton == 1){
      coefficient = ((ld * ld) / ((lt / 2) * (lt / 2) * 3.1415)).toStringAsFixed(4);
    }else if(topSelectedButton == 0 && bottomSelectedButton == 2){
      coefficient = ((ld * rd) / ((lt / 2) * (lt / 2) * 3.1415)).toStringAsFixed(4);

    }else if(topSelectedButton == 1 && bottomSelectedButton == 0){
      coefficient = ((ld / 2) * ((ld / 2) * 3.14) / (lt * lt)).toStringAsFixed(4);
    }else if(topSelectedButton == 1 && bottomSelectedButton == 1){
      coefficient = ((ld * ld) / (lt * lt)).toStringAsFixed(4);
    }else if(topSelectedButton == 1 && bottomSelectedButton == 2){
      coefficient = ((ld * rd) / (lt * lt)).toStringAsFixed(4);

    }else if(topSelectedButton == 2 && bottomSelectedButton == 0){
      coefficient = (((ld / 2) * (ld / 2) * 3.1415) / (lt * rt)).toStringAsFixed(4);
    }else if(topSelectedButton == 2 && bottomSelectedButton == 1){
      coefficient = ((ld * ld) / (lt * rt)).toStringAsFixed(4);
    }else if(topSelectedButton == 2 && bottomSelectedButton == 2){
      coefficient = ((ld * rd) / (lt * rt)).toStringAsFixed(4);
    }
    // calculate();
    // notifyListeners();
  }

  void setMass(int index, int order){
    switch(order){
      case 0:
        mass = (index).toString() + mass.substring(1, 4);
        break;
      case 1:
        mass = mass.substring(0, 1) + index.toString() + mass.substring(2, 4);
        break;
      case 2:
        mass = mass.substring(0, 2) + index.toString() + mass.substring(3, 4);
        break;
      case 3:
        mass = mass.substring(0, 3) + index.toString();
        break;
    }
    box.put('mass', mass);
    notifyListeners();
    setCoefficient();
    calculate();
  }

  void sizeScroll(String location, int index){
    switch(location){
      case 'TL':
        lt = index;
        box.put('lt', lt);
        notifyListeners();
      case 'TR':
        rt = index;
        box.put('rt', rt);
        notifyListeners();
      case 'BL':
        ld = index;
        box.put('ld', ld);
        notifyListeners();
      case 'BR':
        rd = index;
        box.put('rd', rd);
        notifyListeners();
    }
    setCoefficient();
    calculate();
  }

  void selectButton(int index, bool top){
    if(top && topSelectedButton != index){
      topSelectedButton = index;
      if(topSelectedButton == 2){
        rt = 8;
      }
      box.put('top', topSelectedButton);
    }if(!top && bottomSelectedButton != index){
      bottomSelectedButton = index;
      if(bottomSelectedButton == 2){
        rd = 8;
      }
      box.put('bottom', bottomSelectedButton);
    }
    notifyListeners();
    setCoefficient();
    calculate();
  }

}
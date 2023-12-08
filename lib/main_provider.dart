import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {

  List<String> buttonImages = ['circle', 'square', 'rect'];
  int topSelectedButton = 0;
  int bottomSelectedButton = 0;
  int sizeTL = 8;
  int sizeTR = 8;
  int sizeBL = 8;
  int sizeBR = 8;
  String coefficient = '0';
  double result = 0;
  String mass = '0000';

  String setCoefficient(){
    coefficient = ((sizeTL + sizeTR) / (sizeBL + sizeBR)).toStringAsFixed(4);
    result = double.parse(mass) * double.parse(coefficient);
    return coefficient;
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
    result = double.parse(mass) * double.parse(coefficient);
    notifyListeners();
  }

  int sizeScroll(String location, int index){
    switch(location){
      case 'TL':
        sizeTL = index;
        notifyListeners();
        return sizeTL;
      case 'TR':
        sizeTR = index;
        notifyListeners();
        return sizeTR;
      case 'BL':
        sizeBL = index;
        notifyListeners();
        return sizeBL;
      case 'BR':
        sizeBR = index;
        notifyListeners();
        return sizeBR;
      default:
        return 8;
    }
  }

  void selectTopButton(int index, bool top){
    if(top){
      topSelectedButton = index;
    }else{
      bottomSelectedButton = index;
    }
    notifyListeners();
  }

}
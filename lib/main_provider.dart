import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {

  List<String> buttonImages = ['circle', 'rect', 'square'];
  int topSelectedButton = 0;
  int bottomSelectedButton = 0;
  int sizeTL = 8;
  int sizeTR = 8;
  int sizeBL = 8;
  int sizeBR = 8;
  late double result;

  String setResult(){
    return ((sizeTL + sizeTR) / (sizeBL + sizeBR)).toStringAsFixed(4);
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
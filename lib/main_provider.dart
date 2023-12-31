import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainProvider extends ChangeNotifier {

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
  bool isDark = true;

  void changeTheme() async{
    isDark = !isDark;
    await box.put('theme', isDark);
    notifyListeners();
  }

  void getData(){
    topSelectedButton = box.get('top') ?? 0;
    bottomSelectedButton = box.get('bottom') ?? 0;
    lt = box.get('lt') ?? 8;
    rt = box.get('rt') ?? 8;
    ld = box.get('ld') ?? 8;
    rd = box.get('rd') ?? 8;
    mass = box.get('mass') ?? '0000';
    coefficient = box.get('coefficient') ?? '0';
    result = box.get('result') ?? '0';
    isDark = box.get('theme') ?? true;
  }

  Future<void> calculate() async{
    var x = '$topSelectedButton$bottomSelectedButton';
    switch(x){
      case '00':
        coefficient = ((ld * ld) / (lt * lt)).toStringAsFixed(4);
        break;
      case '01':
        coefficient = ((ld * ld) / ((lt / 2) * (lt / 2) * 3.1415)).toStringAsFixed(4);
        break;
      case '02':
        coefficient = ((ld * rd) / ((lt / 2) * (lt / 2) * 3.1415)).toStringAsFixed(4);
        break;
      case '10':
        coefficient = ((ld / 2) * ((ld / 2) * 3.14) / (lt * lt)).toStringAsFixed(4);
        break;
      case '11':
        coefficient = ((ld * ld) / (lt * lt)).toStringAsFixed(4);
        break;
      case '12':
        coefficient = ((ld * rd) / (lt * lt)).toStringAsFixed(4);
        break;
      case '20':
        coefficient = (((ld / 2) * (ld / 2) * 3.1415) / (lt * rt)).toStringAsFixed(4);
        break;
      case '21':
        coefficient = ((ld * ld) / (lt * rt)).toStringAsFixed(4);
        break;
      case '22':
        coefficient = ((ld * rd) / (lt * rt)).toStringAsFixed(4);
        break;
    }
    result = (double.parse(mass) * double.parse(coefficient)).toStringAsFixed(1);
    await box.put('top', topSelectedButton);
    await box.put('bottom', bottomSelectedButton);
    await box.put('mass', mass);
    await box.put('rt', rt);
    await box.put('lt', lt);
    await box.put('ld', ld);
    await box.put('rd', rd);
    await box.put('coefficient', coefficient);
    await box.put('result', result);
    notifyListeners();
  }

  void setMass(int index, int order) {
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
    notifyListeners();
  }

  void sizeScroll(String location, int index) {
    switch(location){
      case 'TL':
        lt = index;
        break;
      case 'TR':
        rt = index;
        break;
      case 'BL':
        ld = index;
        break;
      case 'BR':
        rd = index;
        break;
    }
    notifyListeners();
  }

  void selectButton(int index, bool top) {
    if(top && topSelectedButton != index){
      topSelectedButton = index;
      if(topSelectedButton == 2){
        rt = 8;
      }
    }if(!top && bottomSelectedButton != index){
      bottomSelectedButton = index;
      if(bottomSelectedButton == 2){
        rd = 8;
      }
    }
    notifyListeners();
  }

}
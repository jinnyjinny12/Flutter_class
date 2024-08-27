import 'package:flutter/cupertino.dart';

class Counterviewmodel extends ChangeNotifier{
  int _count = 0;
  int get count => _count; // java 의 get 과 같음

  void increment(){
    _count++;
    notifyListeners();
  }

  void decrement(){
    _count--;
    notifyListeners();
  }


}
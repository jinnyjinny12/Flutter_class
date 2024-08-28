import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/CoffeeItem.dart';
import '../services/CoffeeService.dart';
import '../views/CoffeeDetailScreen.dart';

class CoffeeViewModel extends ChangeNotifier {



  List<CoffeeItem> _coffeeItems = [];

  List<CoffeeItem> get coffeeItems => _coffeeItems;

  CoffeeItem? _coffeeItem;

  final Coffeeserivce _coffeeService;

  CoffeeViewModel(this._coffeeService) {
    _initializeHive();
  }

  Future<void> _initializeHive() async{
    await _coffeeService.initailizeHive();
    await fetchCoffeeItems();
  }

  Future<void> fetchCoffeeItems() async{
    _coffeeItems = await _coffeeService.fetchCoffeItems();
    notifyListeners();
  }

  Future<void> detailsCoffeeItem(BuildContext context, int index) async{
    _coffeeItem = _coffeeItems[index];
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Coffeedetailscreen(coffeeItem: _coffeeItem))
    );

    notifyListeners();


  }

  void deleteItem(BuildContext context, int index){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("삭제 확인"),
          content: Text("정말로 이 항목을 삭제하시겠습니까?"),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop(); // 대화 상자 닫기
                },
                child: Text("취소")
            ),
            TextButton(onPressed: () async{
              try{
                await _coffeeService.deleteCoffeeItem(index);
                _coffeeItems.removeAt(index);
                notifyListeners();
                Navigator.of(context).pop();
              }catch(e){
                print("삭제 중 오류 발생 : $e");
              }
            }, child: Text("삭제"))
          ],
        )
    );
  }



}

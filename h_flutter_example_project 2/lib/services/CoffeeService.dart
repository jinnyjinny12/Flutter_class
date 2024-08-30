// 외부 API 와 상호작용. 데이터를 외부와 상호작용을 해서 가공을해서 controller 전달

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:h_flutter_example_project/models/CoffeeItem.dart';
import 'package:http/http.dart' as http;

class CoffeeService{
  Box<CoffeeItem>? _coffeeBox;

  Future<void> initializeHive() async {
    _coffeeBox = await Hive.openBox<CoffeeItem>("coffee Box");
    await fetchCoffeeItems();

  }

  Future<List<CoffeeItem>> fetchCoffeeItems() async{

    if(_coffeeBox!.isNotEmpty){
      // cpffeebox 의 데이터를 list 형식으로 반환함.
      return _coffeeBox!.values.toList();
    }

    const url = "https://api.sampleapis.com/coffee/hot";

    try{

      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        List<dynamic> fetchItems = json.decode(response.body);
        List<CoffeeItem> coffeItems = fetchItems.map(
            (item) => CoffeeItem.fromJson(item)
        ).toList();

        for (var coffee in coffeItems) {
          _coffeeBox!.add(coffee);
        }
        return coffeItems;
      }else{
        print("요청실패 : ${response.statusCode}");
        return [];
      }

    }catch(e){
      print("에러발생: $e");
      return [];

    }

  }
  Future<void> deleteCoffeeItem(int index) async {
    await _coffeeBox?.deleteAt(index);
  }

  Future<void> addCoffeeItem(CoffeeItem coffeeItem) async{
    await _coffeeBox?.add(coffeeItem);
  }


}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveScreen extends StatefulWidget{


  @override
  _HiveState createState()  => _HiveState();
}


class _HiveState extends State<HiveScreen>{
  Box? box;// 데이터를 저장하기 위한 용도의 박스다.

  @override
  void initState() {
    super.initState();
    _openHiveBox();
  }

  Future<void> _openHiveBox() async{
    box = await Hive.openBox("myBox");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          box == null
              ? const Center(child: CircularProgressIndicator()) // 박스가 열리지 않았을 때 로딩 상태를 표기하기 위함
              : const Center(child: Text("hive box is Ready")),

          ElevatedButton(onPressed: (){
            box!.put("key", "hello hive");
          }, child: Text("데이터 저장")),
          ElevatedButton(onPressed: (){
            final value = box!.get("key");
            print(value);
          }, child: Text("조회")),


          ElevatedButton(onPressed: (){
            Map<String, String> mapList = {"key1" :  "value","key2" :  "value","key3" :  "value" };
          final value = box!.get("key");
          print(value);
          }, child: Text("다중데이터 저장")),
          ElevatedButton(onPressed: (){
            final length = box!.length; // 저장소의 길이를 확인한다.
            final values = box!.values;
            print("length : $length \n values: $values");

          }, child: const Text("전체 조회")),

          ElevatedButton(onPressed: (){

            box!.delete("key1");
            final length = box!.length; // 저장소의 길이를 확인한다.
            final values = box!.values;
            print("length : $length \n values: $values");

          }, child: const Text("삭제")),


        ],
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget{
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) { //ScaffoldWidget 에 정의되어 있는  MaterialApp 을 따라가지 않음
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // 페이지의 수
        child: Scaffold(
          appBar: AppBar(
            title: const Text("탭 예제"),
            bottom: const TabBar(
              indicatorColor: Colors.red, // 활성화되어 잇는 페이지를 빨간색으로 표기
              tabs: [
                Tab(icon: Icon(Icons.directions_car), child: Text("자동차")),
                Tab(icon: Icon(Icons.directions_train), child: Text("지하철")),
                Tab(icon: Icon(Icons.directions_bike), child: Text("자전거")),
              ],
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context); // 뒤로가기 버튼 추가
              }, icon: const Icon(Icons.arrow_back))
            ],
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){}, child: const Text("자동차 타고 PathValue 알아보기"))
                  ],
                ),
              ),
              Center(child: Column(
                children: [
                  ElevatedButton(onPressed: (){}, child: const Text("지하철을 타고 단일 parameter 알아보기"))
                ],
              ),)
            ],
          ),
        ),
      ),



    );
  }
}
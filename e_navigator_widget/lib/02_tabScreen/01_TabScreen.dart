

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../03_routerValue/01_PathValueScreen.dart';

/*
* TabBar & TabBarView
* 여러 탭을 사용하여 내용을 구분하고 쉽게 전환할 수 있도록 도와주는 위젯이다.
* 일반적으로 TabBar 는 TabBarview 와 함께 사용되어 각 탭에 해당하늨 ㄴ콘텐츠를 보여주게 된다.
* 이를 통해 사용자 인터페이스를 깔끔하게 구성하고 관련된 내용을 그룹화할 수 있다.
*
* 주요 속성
* Tabs : 탭의 목록을 정의하는 속성으로 일반적으로 Tab위젯을 사용하여 각 탭을 설정한다.
* controller :
* indicator
*
* */


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
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PathValueScreen(),
                            /*
                            * 내비게이션 시스템 라우트에 대한 설정 정보를 담고 있는 클래스이다.
                            * 이 클래스는 라우트의 이름과 추가적은 인자를 전달할 수있도록 도와준다.
                            * 주로 라우트 생성할 때 사용되며, 해당 라우트의 상태와 정보를 관리하는데 유용하다.
                            *
                            * 주요 속성
                            * name: 라우트의 이름을 나타내는 문자열이다. 주로 라우트를 식별하거나 다른 라우트로 정보를 전달하는 데 사용된다.
                            * arguments : 라우트에 전달할 추가적은 인자를 나타내며 특정 데이터나 라우트 간에 전달할 떄 유용하다.
                            * */

                            settings: const RouteSettings(arguments: 1)
                          )
                      );
                    }, child: const Text("자동차 타고 PathValue 알아보기"))
                  ],
                ),
              ),

              Center(child: Column(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, "/query?name=${'이순신'}");
                  }, child: const Text("지하철을 타고 단일 parameter 알아보기")),
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, "/query?name=${'이순신'}&ㅁㅎㄷ=${1}");
                  }, child: const Text("다중 parameter"))
                ],
              ),
              ),

              const Center(child: Text("자전거페이지"),)

            ],
          ),
        ),
      ),



    );
  }
}
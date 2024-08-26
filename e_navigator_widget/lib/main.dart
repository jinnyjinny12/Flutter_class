import 'package:e_navigator_widget/01_basicNavigtion/01_FirstScreen.dart';
import 'package:e_navigator_widget/03_routerValue/02_QueryStringValueScreen.dart';
import 'package:e_navigator_widget/04_pageview/01_pageViewScreen.dart';
import 'package:e_navigator_widget/05_bottomNavigation/01_BottomNavigationScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "navigator App",
      initialRoute: "/", // 기본화면을 지정해준다.
      navigatorObservers: [NavigatorObserverView()],
      onGenerateRoute: (settings){
        Uri uri = Uri.parse(settings.name!);

        if(uri.path == "/query"){

          print(uri.queryParameters);
          final String? name = uri.queryParameters['name'];
          final String? ageString = uri.queryParameters["age"];
          final int? age = ageString !=null ? int.tryParse(ageString) : null;
          return MaterialPageRoute(builder: (context) =>  QueryStringValueScreen(name, age));
        }
     },

     routes: {
        "/" : (context) => const FirstScreen(),
        "/second" : (context) => const SecondScreen(),
        "/pageView" : (context) => PageViewScreen(),
        "/bottom" : (context) => BottomNavigationScreen()
     },
    );
  }
}

/*
* NavigatorObserver _ 클래스의 이력관리를 하는데 사용된다.
* 네비게이션 시스템에서 라우트의 상태변경을 모니터링하고 추적하는데 사용되는 클래스이다.
* 이 클래스를 사용하면 라우트가 추가되거나 제거되는 등의 이벤트를 감지하고 이를 통해 앱 네이게이션의
* 흐름을 제어하거나 로그를 기록하는 등의 작업을 수행할 수있다.
*
* 주요메서드
* 1.didPush : 새로운 라우트가 스택에 추가될 때 호출
* 2.didpop : 라우트가 스택에서 제거될 때 호출
* 3.didRemove : 라우트가 스택에서 제거된 후 호출
* 4. dieReplace : 라우트가 다른 라우트로 교체될 때 호출
*
* 사용 시나리오
* 네비게이션 로그 기록 :사용자 네비게이션 흐름을 분석하기 위해 로그 기록할 때 사용
* 네베게이션 상태 관리 : 특정 이벤트 발생 시 상태를 관리하거나 ui를 업데이트 할 때 사용
* 애널러리스트 통합: 페이지 전환에 대한 데이터를 수집하여 분석할 때 사용
*
* */

class NavigatorObserverView extends NavigatorObserver {


  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print("페이지가 제거되었습니다");

  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute)
;
    print("페이지가 추가되었습니다");
  }
}
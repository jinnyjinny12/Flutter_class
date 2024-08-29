import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h_flutter_example_project/controllers/CoffeeViewModel.dart';
import 'package:h_flutter_example_project/models/FavoriteItem.dart';
import 'package:h_flutter_example_project/services/CoffeeService.dart';
import 'package:h_flutter_example_project/services/FavoriteService.dart';
import 'package:h_flutter_example_project/themes/CoffeeTheme.dart';
import 'package:h_flutter_example_project/widgets/Layout.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'controllers/FavoriteViewModel.dart';
import 'models/CoffeeItem.dart';

/*
*
* 임포트 lib 목록
* $flutter pub add hive // 정량 nosql
* $flutter pub add http // api 요청
* $flutter pub add provider //상태 관리
* $flutter pub add path_provider // 어플리케이션의 경로 취득하기 위함.
* $flutter pub add camera // 카메라 모듈
* $flutter pub add build_runner // 클래스의 반복적인 부분을 하나의 코드로 변환함
* $flutter pub add hive_generator // hive에 model을 저장할 때 직렬화를 위해서 사용됨.
*
* */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);


  // 데이터 타입을 지정해줌.

  Hive.registerAdapter(CoffeeItemAdapter());
  Hive.registerAdapter(FavoriteItemAdapter());

  //box 열기
  await Hive.openBox<FavoriteItem>("FavoriteBox"); // FavoriteItem 만 저장할 수 있는 hive가 만들어짐


  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create:(context) => CoffeeViewModel(CoffeeSerivce())
          ),
          ChangeNotifierProvider(
              create:(context) => FavoriteViewModel(FavoriteService())
          ),
        ]

    )
  );
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  화면의 가장자리까지 공간을 차지하겠따

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  return MaterialApp(
    debugShowCheckedModeBanner : false, // 오른쪽 상단의 띠를 제거함
    title: "my coffee",
    theme: CafeAppTheme.lightTheme,
    darkTheme: CafeAppTheme.darkTheme, // 다크모드 설정시, 다크모드 서정을 따라가겠다
    initialRoute: "/", // 어플리케이션의 기본경로이다.
    routes: {
      "/" : (context) => const Layout() // / 경로 요청이 들어오면 레이아웃을 그려준다.
    },
  );

  }
}



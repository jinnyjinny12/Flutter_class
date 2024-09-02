import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cafe/screen/MenuList.dart';
import 'package:project_cafe/screen/FavoriteView.dart';

import '../model/Card.dart';



// App Bar
// card - 숫자, 이미지,
// 설명: 제목, 내용, enkiet
// 좋아요 버튼, 엑스

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
  int _currentIndex = 0;

  // // 메뉴 정보를 받아오는 것
  // List<Item> _items = List.generate(10, (index) => Item(
  //   title: "제목 $index",
  //   description: "이것은 아이템 $index의 설명입니다.",
  //   imageUrl: "asset/아인슈페너.jpg", // 이미지 경로를 알맞게 설정하세요
  // ));

  // 가상데이터를 리스트에 담음

  List<Item> _items = generateSampleItems(); // 데이터를 따로 받아온다


  List<Item> _likedItems = [];

  final PageController _pageController = PageController();


  void _onLikeChanged(int index) {
    final item = _items[index];

    setState(() {
      if (_likedItems.contains(item)) {
        _likedItems.remove(item);
      } else {
        _likedItems.add(item);
      }
    });
  }


  void _onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            MenuListView(
                items: _items,
                likedItems: _likedItems,
                onLikeChanged: _onLikeChanged,

            ),
            FavoriteView(
                likedItems: _likedItems,

            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTapTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label:"Home"),
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label:"favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label:"main"),
        ],
      ),
    );
  }
}

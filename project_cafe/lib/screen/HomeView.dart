import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cafe/screen/CardList.dart';
import 'package:project_cafe/screen/FavoriteView.dart';

import '../component/Card.dart';



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


  List<Item> _items = List.generate(10, (index) => Item(
    title: "제목 $index",
    description: "이것은 아이템 $index의 설명입니다.",
    imageUrl: "asset/아인슈페너.jpg", // 이미지 경로를 알맞게 설정하세요
  ));

  List<int> _likedItems = [];

  final PageController _pageController = PageController();


  void _onLikeChanged(int index) {
    setState(() {
      if (_likedItems.contains(index)) {
        _likedItems.remove(index);
      } else {
        _likedItems.add(index);
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
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(_currentIndex == 0 ? "Coffee Cards" : "Favorite Items"),


        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            DynamicListView(
                items: _items,
                likedItems: _likedItems,
                onLikeChanged: _onLikeChanged,

            ),
            FavoriteView(
                likedItems: _likedItems,
                items: _items
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

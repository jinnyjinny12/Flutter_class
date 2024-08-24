import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  final List<int> likedItems;
  final List<String> items;


  // 생성자 정의에서 const를 제거하고 괄호와 콜론을 정확하게 기입
  FavoriteView({
    Key? key,
    required this.likedItems,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likedItemsList = likedItems.map((index) => items[index]).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Items"),
      ),
      body: ListView.builder(
        itemCount: likedItemsList.length,
        itemBuilder: (context, index) {
          final item = likedItemsList[index];
          return ListTile(
            title: Text(item),
          );
        },
      ),
    );
  }

}


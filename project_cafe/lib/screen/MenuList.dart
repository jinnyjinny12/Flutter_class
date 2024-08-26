
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cafe/component/Button.dart';

import '../component/Card.dart';


class MenuListView extends StatefulWidget {
  final List<Item> items;
  final ValueChanged<int> onLikeChanged;
  final List<Item> likedItems;


  MenuListView({
    super.key,
    required this.items,
    required this.onLikeChanged,
    required this.likedItems,
  });

  @override
  _DynamicListViewState createState() => _DynamicListViewState();

}

class _DynamicListViewState extends State<MenuListView> {

  // 삭제함수 -> 작동안함.
  void _deleteItem(int index) {
    if (index >= 0 && index < widget.items.length) {
      setState(() {
        // 삭제할 아이템을 먼저 가져옵니다.
        final itemToDelete = widget.items[index];
        // items 리스트에서 아이템을 삭제합니다.
        widget.items.removeAt(index);
        // likedItems 리스트에서 해당 아이템을 삭제합니다.
        widget.likedItems.remove(itemToDelete);
      });
    } else {
      print("Index $index is out of range");
    }
  }

  void _toggleLike(int index) {
    setState(() {
      final item = widget.items[index];

      if (widget.likedItems.contains(item)) {
        widget.likedItems.remove(item);
      } else {
        widget.likedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("MenuList"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final isLiked = widget.likedItems.contains(index);

          return Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    "${index + 1}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(width: 16.0),
                  Image(
                    image: AssetImage(item.imageUrl),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(item.description),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      LikeButton(
                        isLiked: isLiked,
                        onLikeChanged: () => _toggleLike(index),
                      ),
                      DeleteButton(
                        onDelete: () {
                          _deleteItem(index);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )
    );

  }
}




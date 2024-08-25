
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cafe/component/Button.dart';

import '../component/Card.dart';


class DynamicListView extends StatefulWidget {
  final List<Item> items;
  final ValueChanged<int> onLikeChanged;
  final List<int> likedItems;


  DynamicListView({
    super.key,
    required this.items,
    required this.onLikeChanged,
    required this.likedItems,
  });

  @override
  _DynamicListViewState createState() => _DynamicListViewState();

}

class _DynamicListViewState extends State<DynamicListView> {


  // 삭제함수 -> 작동안함.
  void _deleteItem(int index) {
    if (index >= 0 && index < widget.items.length) {
      setState(() {
        widget.items.removeAt(index);
        widget.likedItems.remove(index);
        widget.likedItems.removeWhere((likedIndex) => likedIndex >= widget.items.length);
      });
    } else {
      print("Index $index is out of range");
    }
  }


  void _toggleLike(int index) {
    setState(() {
      if (widget.likedItems.contains(index)) {
        widget.likedItems.remove(index);
      } else {
        widget.likedItems.add(index);
      }
      // onLikeChanged를 호출하여 상위 위젯에 좋아요 상태를 알립니다.
      widget.onLikeChanged(index);
    });
  }


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
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
    );
  }
}




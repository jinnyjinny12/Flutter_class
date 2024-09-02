import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_cafe/component/Button.dart';
import '../model/Card.dart';

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
  _MenuListViewState createState() => _MenuListViewState();
}

class _MenuListViewState extends State<MenuListView> {
  void _deleteItem(int index) {
    if (index >= 0 && index < widget.items.length) {
      setState(() {
        final itemToDelete = widget.items[index];
        widget.items.removeAt(index);
        widget.likedItems.remove(itemToDelete);
      });
    } else {
      print("Index $index is out of range");
    }
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
          final isLiked = widget.likedItems.contains(item);

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
                        onLikeChanged: () => widget.onLikeChanged(index),
                      ),
                      DeleteButton(
                        onDelete: () => _deleteItem(index),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

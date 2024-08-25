import 'package:flutter/material.dart';

import '../component/Card.dart';

class FavoriteView extends StatelessWidget {
  final List<int> likedItems;
  final List<Item> items;

  FavoriteView({
    Key? key,
    required this.likedItems,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likedItemsList = likedItems.map((index) => items[index]).toList();

    return  ListView.builder(
        itemCount: likedItemsList.length,
        itemBuilder: (context, index) {
          final item = likedItemsList[index];
          return Card(
            child: ListTile(
              leading: Image.asset(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
              title: Text(item.title),
              subtitle: Text(item.description),
            ),
          );
        },
      );

  }
}



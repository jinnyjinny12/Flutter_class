import 'package:flutter/material.dart';

import '../component/Card.dart';

class FavoriteView extends StatelessWidget {
  final List<Item> likedItems;


  FavoriteView({
    Key? key,
    required this.likedItems
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Favorite Items")
      ),
      body: ListView.builder(
        itemCount: likedItems.length,
        itemBuilder: (context, index) {
          final item = likedItems[index];
          return Card(
            child: ListTile(
              leading: Image.asset(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
              title: Text(item.title),
              subtitle: Text(item.description),
            ),
          );
        },
      ),
    );


  }
}





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/models/CoffeeItem.dart';

class CoffeeDetailScreen extends StatelessWidget {

  final CoffeeItem? coffeeItem;

  CoffeeDetailScreen({required this.coffeeItem, super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffeeItem?.title ?? "No Title"),  // null 체크 추가
      ),
      body: Center(
        child: Text(coffeeItem?.description ?? "No Description"),  // null 체크 추가
      ),
    );
  }



}
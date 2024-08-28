


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/models/CoffeeItem.dart';

class CoffeeDetialscreen extends StatelessWidget {

  final CoffeeItem coffeeItem;

  CoffeeDetialscreen({required this.coffeeItem, super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffeeItem.title.toString()),
      ),
      body:  Center(
        child: Text(''),
      ),
    )

  }
}
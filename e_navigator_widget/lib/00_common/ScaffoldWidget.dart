import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scaffoldwidget extends StatelessWidget{
  Widget? widget;

  Scaffoldwidget({required this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigation  위젯")),
      body: widget,
    );
  }
}
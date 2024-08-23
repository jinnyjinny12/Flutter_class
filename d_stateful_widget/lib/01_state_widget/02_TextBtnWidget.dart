import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextBtnWidget extends StatelessWidget{
  final VoidCallback onPressed;

  const TextBtnWidget(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text("평면 형태의 버튼으로 증가 "),
        onPressed: () => onPressed(),
      ),
    );
  }
}
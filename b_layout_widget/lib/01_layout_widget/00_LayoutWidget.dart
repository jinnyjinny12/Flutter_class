
import 'package:b_layout_widget/01_layout_widget/04_StackWidget.dart';
import 'package:b_layout_widget/01_layout_widget/05_ListViewWidget.dart';
import 'package:b_layout_widget/01_layout_widget/06_WrapWidget.dart';
import 'package:b_layout_widget/01_layout_widget/07_PaddingWidget.dart';
import 'package:b_layout_widget/01_layout_widget/08_AlignContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:b_layout_widget/01_layout_widget/01_MediaQueryWidget.dart';
import 'package:b_layout_widget/01_layout_widget/02_SizedBoxWidget.dart';
import 'package:b_layout_widget/01_layout_widget/03_RowWidget.dart';

class LayoutCombination extends StatelessWidget{

  LayoutCombination({super.key});

  @override
  Widget build(BuildContext context) {
    // 현재 화면을 기준으로 화며의 너비를 가져오겠다.
    double screenWidth = MediaQuery.of(context).size.width;

    return ListView( // 05 번에서 자세히 다룸.

      /*
      * EdgetInsets
      * 위젯의 여백이나 패딩을 설정할 때 사용하는 클래스이다.
      * 이 클래스는 네 방향(위, 아래, 왼쪽, 오른쪽)의 여백을 개별적으로 설정할 수 있는 다양한 생성자를 제공한다.
      *
      * .all : 모든 방향에 동일한 �
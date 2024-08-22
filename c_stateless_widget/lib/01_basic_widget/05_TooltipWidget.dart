
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* tooltip
* 주로 마우스를 올리거나 길게 눌렀을 때 추가 정보를 제공하는 팝업이다.
* 주로 버튼, 아이콘 링크 등에서 사용되며 해당 요소의 기능이나 의미를 이해하는데 도움을 준다.
*
* 주요 특징
* 사용자 친화적: 사용자의 ui 요소의 기능을 쉽게 이해할 수 있다.
* 자동표시 : 특정 기간 동안 요소에 마우스를 올리면 자동으로 표시된다.
*
*
* */

class TooltipWidget extends StatelessWidget{
  const TooltipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Tooltip(
        message: "사용자에게 안내를 게시합니다.",
        child: Text("Tooltip의 기능을 알아봅시다"),
      )
    );
  }
}
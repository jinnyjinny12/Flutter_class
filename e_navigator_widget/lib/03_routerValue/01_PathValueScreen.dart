import 'package:e_navigator_widget/00_common/ScaffoldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathValueScreen extends StatelessWidget{
  const PathValueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int? pathValue = ModalRoute.of(context)!.settings.arguments as int?;
    // int 타입으로 반환시켜야 한다.

    return Scaffoldwidget(widget: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text("pathValue : $pathValue"),
         ElevatedButton(onPressed: (){
           Navigator.pop(context);
         }, child: const Text ("이전 페이지"))
       ],
     ),
    ));


  }
}
import 'package:flutter/material.dart';

//画像引用
//https://illustimage.com/

//メニュー画面
class  menuscreen extends StatelessWidget {
  const menuscreen ({super.key});

  //選択tabの初期値
  // int _currentPageIndex = 0;
  //
  // void _onItemTapped(int index){
  //   //tapされたindexを_currentPageIndexに代入する
  //   setState((){
  //     _currentPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
         TabBar(
//           onTap: _onItemtapped,
           tabs: [
             Tab(text: '1'),
             Tab(text: '2'),
           ],
           indicatorColor: Colors.black,
         ),
        backgroundColor: Color.fromRGBO(200,38,31,1),
      ),

    );
  }
}

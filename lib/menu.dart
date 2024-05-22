import 'package:flutter/material.dart';

//メニュー項目イラスト画像引用元
//https://illustimage.com/

//メニュー画像引用
//https://www.itoyokado.co.jp/pp/menu/season/

//メニュー画面
class  menuscreen extends StatelessWidget {
  const menuscreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      initialIndex: 0, //最初のタブ
      length: 6, //タブの数
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('メニュー',
            style: TextStyle(
                color: Color.fromRGBO(134,108,20, 1),),
          ),
          bottom: TabBar(
            isScrollable: true, //スクロールを有効化
            tabs: <Widget>[
             Tab(
               // child: Padding(
               //   padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
               // ),
               text: 'ラーメン',
               icon: Image.asset('assets/menu/ramen-35px.png',
                  fit: BoxFit.contain,
                ),
             ),
             Tab(
               text: 'チャーハン',
               icon: Image.asset('assets/menu/mesi-35px.png',
                 fit: BoxFit.contain,
                 ),
             ),
             Tab(
               text: '焼き物',
               icon: Image.asset('assets/menu/yaki-35px.png'),
             ),
             Tab(
               text: 'ポテト',
               icon: Image.asset('assets/menu/poteto-35px.png'),
             ),
             Tab(
               text: 'スイーツ',
               icon: Image.asset('assets/menu/ice-35px.png'),
             ),
             Tab(
               text: 'ドリンク',
               icon: Image.asset('assets/menu/juice-35px.png'),
             ),
            ],
             indicatorColor: Color.fromRGBO(134,108,20, 1),
           ),
          backgroundColor: Color.fromRGBO(250,196,16,1),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                      children: <Widget>[
                        Container(
                          child:
                          Image.asset('assets/menu/ramen/pp-tonkotu-ramen.jpg',
                            height: 300,
                            //fit: BoxFit.contain,
                          ),
                        ),
                        Text('とんこつラーメン'),
                        Image.asset('assets/menu/ramen/pp-shoyu-ramen.jpg',
                          height: 300,
                        ),
                        Text('しょうゆラーメン'),
                        Image.asset('assets/menu/ramen.png',
                          height: 300,
                        ),
                        Text('塩ラーメン'),
                        Image.asset('assets/menu/ramen.png',
                          height: 300,
                        ),
                        Text('みそラーメン'),
                      ],
                ),

            ),
            Center(
              child: Text('22222'),
            ),
          ],
        ),
      ),
    );
  }


}
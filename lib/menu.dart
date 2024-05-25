import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pp/manudetail.dart';

//メニュー項目イラスト画像引用元
//https://illustimage.com/

//メニュー画像引用
//https://www.itoyokado.co.jp/pp/menu/season/

//メニュー画面
class  menuscreen extends StatelessWidget {
   menuscreen ({super.key});

   List newmenu = [
     "冷やし中華","ミチャーハン", "チャーハン"
   ];
   List newvalue = [
     "税込　2900円","税込　290円", "税込　11290円"
   ];

   List newimage = [
     'assets/menu/New/pp-hiyashicyuuka.jpg','assets/menu/mesi/pp-mini-chahan.jpg','assets/menu/mesi/pp-mini-chahan.jpg',
   ];

   List  newtap = [
     '11','22','33'
   ];

   @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return  DefaultTabController(
      initialIndex: 0, //最初のタブ
      length: 7, //タブの数
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
                text: '新登場',
                icon: Image.asset('assets/menu/new-35px.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
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


            ListView.builder(
              itemCount: newmenu.length,
              itemBuilder: (context,index) {
                return ListTile(
                    onTap: (){
                      //print(newtap[index]);
                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          menudetailscreen(newimage[index],newmenu[index],newvalue[index])
                      ));
                    },
                    title: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(newimage[index]),
                        ),
                        Text(newmenu[index]), //メニュー名
                        Text(newvalue[index]), //価格
                      ]
                    ),
                );
              }
            ),
            SingleChildScrollView(
              child: GestureDetector(
                onTap: (){
                  //debugPrint('ssss');
                }
                ,
                child: Column(
                        children: <Widget>[
                          Container(
                            child:
                            Image.asset('assets/menu/ramen/pp-tonkotu-ramen.jpg',
                              //height: 300,
                              //fit: BoxFit.contain,
                            ),
                          ),
                          Text('とんこつラーメン'),
                          Text('税込　580円'),

                          Image.asset('assets/menu/ramen/pp-shoyu-ramen.jpg',
                            height: 300,
                          ),
                          Text('しょうゆラーメン'),
                          Text('税込　520円'),
                          Image.asset('assets/menu/ramen/pp-shio-ramen.jpg',
                            height: 300,
                          ),
                          Text('塩ラーメン'),
                          Text('税込　520円'),
                          Image.asset('assets/menu/ramen/pp-miso-ramen.jpg',
                            height: 300,
                          ),
                          Text('みそラーメン'),
                          Text('税込　580円'),
                        ],
                  ),
              ),

            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/menu/mesi/pp-mini-chahan.jpg'),
                  Text('ミニチャーハン'),
                  Text('税込　290円'),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/menu/yaki/pp-takoyaki-source.jpg'),
                  Text('たこ焼き　ソース'),
                  Text('（8個） 税込　550円'),
                  Text('（16個） 税込　1000円'),

                  Image.asset('assets/menu/yaki/pp-okonomiyaki.jpg'),
                  Text('こだわりのお好み焼'),
                  Text('税込　580円'),

                  Image.asset('assets/menu/yaki/pp-source-yakisoba.jpg'),
                  Text('ソース焼きそば'),
                  Text('税込　580円'),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/menu/poteto/pp-frenchfries.jpg'),
                  Text('フライドポテト'),
                  Text('（小盛り） 税込　180円'),
                  Text('（山盛り） 税込　350円'),
                  Text('（メガ盛り） 税込　520円'),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/menu/sweets/pp-koganeyaki-azuki.jpg'),
                  Text('今川焼き　あずき'),
                  Text('（１個） 税込　120円'),

                  Image.asset('assets/menu/sweets/pp-koganeyaki-custard.jpg'),
                  Text('今川焼き　クリーム'),
                  Text('（１個） 税込　120円'),

                  Image.asset('assets/menu/sweets/pp-softcream-milk.jpg'),
                  Text('ソフトクリーム　北海道ミルク'),
                  Text('税込　250円'),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/menu/drink/pp-drink.jpg'),
                  Text('ドリンク'),
                  Text('（S） 税込　130円'),
                  Text('（M） 税込　200円'),

                  Image.asset('assets/menu/drink/pp-float.jpg'),
                  Text('フロート'),
                  Text('税込　320円'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
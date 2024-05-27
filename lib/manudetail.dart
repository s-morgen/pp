import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

//メニュー画面の詳細
class menudetailscreen extends StatelessWidget {

  //引数1:メニュー画像　引数2:メニュータイトル 引数3:価格
  menudetailscreen(this.image,this.name,this.value);

  String image;
  String name;
  String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('メニュー',
          style:
            TextStyle(
              color: Color.fromRGBO(134,108,20, 1),
            ),
          ),
          backgroundColor: Color.fromRGBO(250,196,16,1),
          actions: <Widget>[
            IconButton(
                onPressed: (){
                  Share.share('元気いっぱいのファーストフードショップ ポッポの「' + name + '」');
            },
                icon: Icon(Icons.share)
            ),
          ],
        ),
        body: Column(
              children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:Image.asset(image),
                    ),
                  ),

                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(name,
                    style: TextStyle(fontSize: 24),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10.0,0,0,0),
                  alignment: Alignment.bottomLeft,
                  child: Text(value,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              Divider(
                color: Color.fromRGBO(221,221,221, 1),
                indent: 20,
                endIndent: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('リンゴ酢を配合したフルーティな酸味のある醤油ベースのタレに、もちもち麺と冷し中華定番具材（チャーシュー、錦糸卵、トマト、キュウリ、わかめ、紅生姜）をあわせた、何処か昔懐かしい味わいの定番冷し中華です。'),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('価格は10%税込み価格を表記しています。',
                    style: TextStyle(
                      color: Colors.red),
                  ),
                ),
            ],
        ),
    );
  }
}

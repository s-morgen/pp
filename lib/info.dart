import 'package:flutter/material.dart';
//お知らせ画面
class infoscreen extends StatelessWidget {
  const infoscreen({super.key});

  @override
  Widget  build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true, //タイトル中央揃え
        title:
        const Text('おしらせ',
            style:
              TextStyle(
                color: Colors.white,
              ),
        ),
        backgroundColor: Color.fromRGBO(200,38,31,1),
      ),
      body:
      ListView(
        children: <Widget>[
           ListTile(
              leading:
                Icon(
                  Icons.circle,
                  color: Color.fromRGBO(200,38,31,1),
              ),
              //tileColor: Colors.yellow,
              title: Text("新メニューのお知らせ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(200,38,31,1),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              //tileColor: Colors.yellow,
              leading: Image.asset('assets/image/pp-hiyasi-cyuka.jpg',width: 100,height: 50,),
              title: Text("冷やし中華が新登場"),
              subtitle: Text('リンゴ酢を配合したフルーティな酸味のある醤油ベースのタレに、もちもち麺と冷し中華定番具材（チャーシュー、錦糸卵、トマト、キュウリ、わかめ、紅生姜）をあわせた、何処か昔懐かしい味わいの定番冷し中華です。'),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
              borderRadius: BorderRadius.circular(20),
              ),
              isThreeLine: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              leading: Image.asset('assets/image/pp-kakigori.jpg',width: 100),
              title: Text('かき氷が新登場'),
              subtitle: Text('昭和の縁日をイメージしたお子様が大好きなシンプルかき氷です。'),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.red,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              //onTap: () => print('ListTileが押された'),
              isThreeLine: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  leading: Image.asset('assets/image/pp-meronsoft.jpg',width: 100),
                  title: Text('北海道メロンソフトが新登場'),
                  subtitle: Text('みずみずしい甘さとフルーティな香りが漂う、ちょっと贅沢なソフトクリームです。'),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.red,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  isThreeLine: true,
                ),
          ),
          ListTile(
            leading:
              Icon(
                Icons.circle,
                color: Color.fromRGBO(200,38,31,1),
              ),
            //tileColor: Colors.yellow,
            title: Text("販売メニューのお知らせ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(200,38,31,1),
              ),
            ),
          ),
          ListTile(
            subtitle: Text('一部店舗では曜日・時間帯で販売出来ないメニューがある場合がございます。食材仕入の都合により一部メニューの食材に変更がある場合がございます。お客様にはご不便をおかけいたしますがご理解賜りますようお願い申しあげます。'),
            isThreeLine: true,
          ),
        ],

      ),
    );
  }
}

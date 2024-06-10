import 'package:flutter/material.dart';

class secretformulascreen extends StatelessWidget {
   secretformulascreen(this.title);
   String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50], //背景色
      appBar: AppBar(
        centerTitle: true,
        title: Text(title,
          style:
            TextStyle(
              color: Colors.white,
            ),
        ),
        backgroundColor: Color.fromRGBO(200,38,31,1),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/secret/pp-info-takoyaki-isolated.png'),
              ),
              Text('外は香ばしく、中はとろとろ。'),
              Text('ダシが香る風味豊かなたこ焼です。'),
              Text('素材のこだわり',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.red,),
              ),
             ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/secret/pp-info-takoyaki-kodawari-img1.jpg'),
              ),
              Text('たこ焼の主役といえば、プリップリの「たこ」。'),
              Text('ポッポのたこ焼には、様々な産地から厳選した「たこ」を使用しています。'),
              Text('たこ焼に最適な食感になるよう、"茹で上げる時間"を工夫しています。'),
              Text('こだわりが詰まった美味しさをお楽しみ下さい。'),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/secret/pp-info-takoyaki-kodawari-img2.jpg'),
              ),
              Text('おいしさの秘訣',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.red,),
              ),
              Text('ポッポのたこ焼は『外は香ばしく、中身はふんわりとろけるよう』に仕上げ、'),
              Text('食べると口いっぱいにアツアツの美味しさが広がります。'),
              Text('生地には「鶏」や「さば」のダシと、卵を加えた風味豊かな味わい。'),
              Text('焼きたてアツアツはもちろん、お持ち帰りでもおいしく召し上がって頂けるたこ焼です。'),
            ],
          ),

      ),
    );
  }
}

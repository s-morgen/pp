import 'package:flutter/material.dart';

//お知らせ画面
class secretformula extends StatelessWidget {
   secretformula({super.key});

   List kanbanmenu = [
    "たこ焼き","ラーメン", "今川焼き"
  ];

   List kanbanimg = [
     "assets/info/pp-pickUp-takoyaki-img.jpg","assets/info/pp-pickUp-ramen-img.jpg", "assets/info/pp-pickUp-koganeyaki-img.jpg"
   ];


  @override
  Widget  build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        centerTitle: true, //タイトル中央揃え
        title:
        const Text('おいしさのわけ',
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
              title: Text("看板商品おいしさの秘密をご紹介します",
                style: TextStyle(
                    color: Color.fromRGBO(200,38,31,1),
                ),
              ),
            ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: kanbanmenu.length,
            itemBuilder: (context, index){
              return Card(
                child: ListTile(
                  title: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:Image.asset(kanbanimg[index]),
                        ),
                        Text(kanbanmenu[index]),
                      ]
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

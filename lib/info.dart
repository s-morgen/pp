import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pp/model.dart';
import 'package:pp/secretformula.dart';

import 'manudetail.dart';
//お知らせ画面
class infoscreen extends StatelessWidget {
  const infoscreen({super.key});

  //お知らせ情報をforebaseから取得
  Future<List<news_list>> _fetchPersons() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('news').where('display', isEqualTo: true).orderBy('no').get(const GetOptions(source: Source.cache));
    final person = snapshot.docs.map((doc) => news_list.fromMap(doc.data())).toList();
    return person;
  }

  @override
  Widget  build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[50],
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
                style: TextStyle(
                    color: Color.fromRGBO(200,38,31,1),
                ),
              ),
            ),
          FutureBuilder<List<news_list>>(
              future: _fetchPersons(),
              builder: (context, snapshot) {

                //データ読み込み時は読み込みを表すサークルを表示
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                //エラー時の処理
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final persons = snapshot.data! ;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // Listのデータの数を数える
                  itemCount: persons.length,
                  itemBuilder: (context, index) {

                    final person = persons[index];

                    return Card( //枠線に影をつけるためcardでネスト
                      child: ListTile(
                        tileColor: Colors.yellow[50],
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              menudetailscreen(person.imgurl,person.title,'',person.text,'')
                          ));
                        },
                        title: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                //ネットワークから取得した画像をキャッシュから表示
                                child: CachedNetworkImage(
                                  imageUrl: '${person.imgurl}',
                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                      CircularProgressIndicator(value: downloadProgress.progress), //読み込み中はサークルを表示
                                  errorWidget: (context, url, dynamic error) => const Icon(Icons.error), //エラー時はエラーアイコンを表示
                                ),
                            ),
                            Text('${person.title}'), //newsタイトル
                            //Text('${person.text}'), //news本文
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
          ),
          ListTile(
            leading:
            Icon(
              Icons.circle,
              color: Color.fromRGBO(200,38,31,1),
            ),
            //tileColor: Colors.yellow,
            title: Text("販売メニューのお知らせ",
              style: TextStyle(
                color: Color.fromRGBO(200,38,31,1),
              ),
            ),
          ),
          ListTile(
            subtitle: Text('一部店舗では曜日・時間帯で販売出来ないメニューがある場合がございます。食材仕入の都合により一部メニューの食材に変更がある場合がございます。お客様にはご不便をおかけいたしますがご理解賜りますようお願い申しあげます。'),
            isThreeLine: true,
          ),
          ListTile(
            leading:
            Icon(
              Icons.circle,
              color: Color.fromRGBO(200,38,31,1),
            ),
            //tileColor: Colors.yellow,
            title: Text("ポッポのおいしさのわけ",
              style: TextStyle(
                color: Color.fromRGBO(200,38,31,1),
              ),
            ),
          ),
          Card(
            child: ListTile(
              tileColor: Colors.yellow[50],
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    secretformula()
                ));
              },
              title: Column(
                children: [
                  ClipRRect(
                      borderRadius:
                        BorderRadius.circular(10),
                      child:
                        Image.asset('assets/info/pp-info-takoyaki-kodawari-img2.jpg'),
                  ),
                  Text('看板商品「たこ焼」「らーめん」「今川焼」'),
                  Text('そのおいしさの秘密をご紹介します。'),
                  //isThreeLine: true,
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

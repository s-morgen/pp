import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'model.dart';

//メニュー画面の詳細
class menudetailscreen extends StatelessWidget {

  //引数1:メニュー画像　引数2:メニュータイトル 引数3:価格
  menudetailscreen(this.image,this.name,this.value,this.text,this.id);

  String image;
  String name;
  String value;
  String text;
  String id;

  //アレルギー情報をfirebaseから取得
  Future<List<get_allergy>> _fetchPersons_allergy() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('menu').where('id', isEqualTo: id).get();
    final person = snapshot.docs.map((doc) => get_allergy.fromMap(doc.data())).toList();
    return person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
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
                      //child: Image.network(image),
                      child: CachedNetworkImage(
                          imageUrl: image,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, dynamic error) => const Icon(Icons.error)
                      ),
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
              //説明文
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ),
              Divider(
                color: Color.fromRGBO(221,221,221, 1),
                indent: 20,
                endIndent: 20,
              ),
              //アレルギー情報
              Container(
                child: FutureBuilder<List<get_allergy>>(
                    future: _fetchPersons_allergy(),
                    builder: (context ,snapshot) {
                      //データ読み込み時は読み込みを表すサークルを表示
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      //エラー時の処理
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      final persons = snapshot.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // Listのデータの数を数える
                        itemCount: persons.length,
                        itemBuilder: (context, index) {
                          final person = persons[index];

                          return ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('アレルギー情報'),
                                    Text('${person.allergy}'),
                                  ],
                                ),
                          );
                        },
                      );
                    },
                  ),
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


import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'model.dart';

//店舗詳細画面
class shopdetailscreen extends StatelessWidget {
  shopdetailscreen (this.todoufuken,this.shopmei);
  String todoufuken;
  String shopmei;

  //firebaseから店舗名を取得
  Future<List<shop_list>> _fetchPersons() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('shop').where('ken', isEqualTo: todoufuken).get(); //const GetOptions(source: Source.cache)
    final person = snapshot.docs.map((doc) => shop_list.fromMap(doc.data())).toList();

    return person;
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          centerTitle: true,
          title:
             Text( todoufuken + ' 店舗一覧' ,
            style: TextStyle(color: Colors.white),
            ),
        backgroundColor: Color.fromRGBO(200,38,31,1),
        ),

      body:
        SingleChildScrollView(
          child:
            FutureBuilder<List<shop_list>>(
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
                    itemCount: persons.length,
                    itemBuilder: (context , index ) {

                    final person = persons[index];

                      return Card(
                        child: ListTile(
                          tileColor: Colors.yellow[50],
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${person.shop}'),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: '${person.img}',
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress), //読み込み中はサークルを表示
                                    errorWidget: (context, url, dynamic error) => const Icon(Icons.error), //エラー時はエラーアイコン
                                  ),
                                ),
                                Text('${person.post}' + ' ' + '${person.address}'),
                                Text('${person.time}'),
                                Text('${person.info}' ?? '' ), //お知らせがあれば表示
                                ],
                          ),
                        ),
                      );
                    }
                  );
                }
            ),
        ),
    );
  }
}

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model.dart';
//店舗詳細画面
class shopdetailscreen extends StatelessWidget {
  shopdetailscreen (this.todoufuken,this.shopmei,this.number);
  String todoufuken;
  String shopmei;
  int number;

  //firebaseから店舗名を取得
  Future<List<shop_list>> _fetchPersons() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('shop').where('ken', isEqualTo: todoufuken).get(); //const GetOptions(source: Source.cache)
    final person = snapshot.docs.map((doc) => shop_list.fromMap(doc.data())).toList();
    return person;
  }

  @override
  Widget build(BuildContext context) {

    //店舗名を分割
    //List<String> shopmeilist = shopmei.split("/");

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

              // if(snapshot.data() != null) {
              //   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
              // }

              final persons = snapshot.data! ;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: persons.length,
                itemBuilder: (context , index ) {

                //final shop = shopmeilist[index];
                final person = persons[index];

                 print(persons.length);
                //print(shopmeilist.length);
                  return Card(
                    child: ListTile(
                      title: Column(
                          children: [
                            //Text('${person.shop}'),
                            Text('aaaa'),
                          ],
                      ),
                    ),
                  );
                }
              );
            }
        ),
    );
  }
}

import 'package:flutter/material.dart';
//店舗詳細画面
class shopdetailscreen extends StatelessWidget {
  shopdetailscreen (this.todoufuken,this.shopmei);
  String todoufuken;
  String shopmei;

  @override
  Widget build(BuildContext context) {

    //店舗名を分割
    List<String> shopmeilist = shopmei.split("/");

  //print('$shopmeilist');
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

      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: shopmeilist.length,
        itemBuilder: (context , index ) {
          //print(shopmeilist.length);
            ListTile(
              title: Column(
                children: <Widget>[
                  Text('${shopmeilist[index]}'),
                  Text('ssssssss'),
                ],
              ),
            );
        }
      ),
    );
  }
}

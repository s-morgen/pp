import 'package:flutter/material.dart';
import 'package:pp/shopdetail.dart';

//店舗一覧画面
class  shopscreen extends StatelessWidget {
   shopscreen ({super.key});

   List todoufuken = [
     "北海道","青森県", "岩手県","宮城県","東京都",
     "神奈川県",
     "千葉県","埼玉県","茨城県","山梨県","静岡県",
     "大阪府","兵庫県"
   ];

   List shopmei = [
   "帯広店/屯田店","青森店/八戸沼館店/弘前店","花巻店","石巻あけぼの店","大森店/アリオ葛西店/木場店/八王子店/東久留米店/南大沢店/四つ木店",
   "伊勢原店/大船店/川崎店/川崎港町店/古淵店/湘南台店/立場店/たまプラ－ザ店/ららぽ－と横浜店",
    "流山店/幕張店/四街道店","大宮宮原店/三郷店","竜ヶ崎店","甲府昭和店","静岡店/三島店",
   "アリオ八尾店/津久野店","明石店"

   ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          centerTitle: true,
          title:
            const Text('店舗一覧',
                style: TextStyle(color: Colors.white),
            ),
          backgroundColor: Color.fromRGBO(200,38,31,1),
          ),


      body: ListView.builder(
        itemCount: todoufuken.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                    shopdetailscreen(todoufuken[index],shopmei[index])
                ));
              },
              title: Text(todoufuken[index]),
              subtitle: Text(shopmei[index]),

            ),
          );
        },
      ),
    );
  }
}

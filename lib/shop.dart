import 'package:flutter/material.dart';
import 'package:http/http.dart';

//店舗一覧画面
class  shopscreen extends StatelessWidget {
   shopscreen ({super.key});

   List listdatas = [
   {'icon': Icons.person,'title': "人物アイコン",},
   {'icon': Icons.mail,'title': "メールアイコン",},
   {'icon': Icons.map,'title': "地図アイコン",},
   {'icon': Icons.map,'title': "地図アイコン",},
   {'icon': Icons.map,'title': "地図アイコン",},
   {'icon': Icons.play_arrow,'title': "再生ボタン",},
   {'icon': Icons.photo_sharp,'title': "写真アイコン",},
   ];


   List todatas = [
     "人物アイコン","メールアイコン", "地図アイコン","地図アイコン","地図アイコン","再生ボタン","写真アイコン",
   ];
   List listicon = [Icons.person,Icons.mail];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ListView.builder(
        itemCount: listicon.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(todatas[index]),
            leading: Icon(listicon[index]),
          );
        },
      ),


      // body: ListView(
      //   children: _getItems(),
      // ),


        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: ListView(
        //     children: [
        //       ListTile(
        //         leading: Icon(Icons.person),
        //         title: Text("人物アイコン"),
        //         onTap: () {},
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.mail),
        //         title: Text("メールアイコン"),
        //         onTap: () {},
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.map),
        //         title: Text("地図アイコン"),
        //         onTap: () {},
        //       )
        //     ],
        //   ),
        // )
    );
  }
   List<Widget> _getItems() {
     final List<Widget> _todoWidgets = <Widget>[];
     for (String title in todatas) {
       _todoWidgets.add(
         ListTile(
           //leading: Icon(Text),
          title: Text(title)),
       );
     }
     return _todoWidgets;
   }
}

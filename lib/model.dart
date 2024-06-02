class Person {
  final String title;
  final String value;
  final String text;
  final String imgURL;
  final String id;
  final String No;

  Person({required this.No,required this.title, required this.value, required this.text, required this.imgURL,required this.id});

  factory Person.fromMap(Map<String, dynamic> data) {
    return Person(No: data['No'],title: data['title'], value: data['value'], text: data['text'], imgURL: data['imgURL'],id: data['id']);
  }
}

//お知らせ取得用
class news_list {
  final String title;
  final String text;
  final String imgurl;
  final num no;

  news_list({required this.no,required this.title,  required this.text, required this.imgurl});

  factory news_list.fromMap(Map<String, dynamic> data) {
    return news_list(no: data['no'],title: data['title'],  text: data['text'], imgurl: data['imgurl']);
  }
}

//店舗情報用
class shop_list {
  final String shop;
  final String img;
  final String post;
  final String address;
  final String tel;
  final String time;

  shop_list({required this.shop, required this.img,  required this.post,
  required this.address,required this.tel,required this.time});

  factory shop_list.fromMap(Map<String, dynamic> data) {
    return shop_list(shop: data['shop'],  post: data['post'], img: data['img'],
    address: data['address'],tel: data['tel'],time: data['time']);
  }
}

//アレルギー情報取得用
class get_allergy {
  final String title;
  final String allergy;

  get_allergy({required this.title, required this.allergy});

  factory get_allergy.fromMap(Map<String, dynamic> data) {
    return get_allergy(title: data['title'], allergy: data['allergy']);
  }
}

class get_allergy_nutrition{
  final String title;
  final String allergy;
  final String kcal;

  get_allergy_nutrition({required this.title, required this.allergy, required this.kcal});

  factory get_allergy_nutrition.fromMap(Map<String, dynamic> data) {
    return get_allergy_nutrition(title: data['title'], allergy: data['allergy'], kcal: data['kcal'],);
  }
}
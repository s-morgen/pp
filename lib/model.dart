class Person {
  final String title;
  final String value;
  final String text;
  final String imgURL;

  Person({required this.title, required this.value, required this.text, required this.imgURL});

  factory Person.fromMap(Map<String, dynamic> data) {
    return Person(title: data['title'], value: data['value'], text: data['text'], imgURL: data['imgURL']);
  }
}
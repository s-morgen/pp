import 'package:flutter/material.dart';
import 'menu.dart';
import 'shop.dart';
import 'seasonal.dart';
import 'info.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration( //スクロールの挙動設定
          behavior: const CustomScrollBehavior(),
          child: child!,
        );
      },
      title: 'ポッポ',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),  //ダークモード対応
      themeMode: ThemeMode.light,    //テーマ設定をシステムに合わせる
      theme: ThemeData(
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get bottomNavigationBar => null;

  static List<StatelessWidget> _screens = [
    infoscreen(),
    menuscreen(),
    shopscreen(),
    seasonalscreen()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red, //選択時のアイコン色
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_chart_outlined),
                label: 'おしらせ',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'メニュー',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: '店舗一覧',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.phone),
                label: 'お問い合わせ',
              ),
            ],
        ),

    );
  }
}

//引っ張り時のエフェクトを無効（アプリ全体）
class CustomScrollBehavior extends ScrollBehavior {
  const CustomScrollBehavior();
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}


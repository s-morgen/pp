import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:pp/menu.dart';
import 'package:pp/shop.dart';
import 'package:pp/seasonal.dart';
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

  static const _screens = [
    infoscreen(),
    menuscreen(),
    shopscreen(),
    seasonalscreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _screens[_selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse('https://s2.kingtime.jp/independent/recorder2/personal/')) //初めに開くページの設定
    //..loadRequest(Uri.parse('https://www.itoyokado.co.jp/pp/')) //ポッポHP
      ..setJavaScriptMode(JavaScriptMode.unrestricted) //JavaScript モードの設定
      ..setBackgroundColor(Colors.black)  //Webサイトの背景色
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            //log('progress: $progress');
          },
          onPageStarted: (String url) {
            //ページ読み込み時
            //log('page started: $url');
          },
          onPageFinished: (String url) {
            //読み込み完了時
            //log('page finished: $url');
          },
          onWebResourceError: (WebResourceError error) {
            //エラー時の処理
            //log('error: $error');
          },
          onNavigationRequest: (NavigationRequest request) {
            //ページのURLがyoutubeとなる場合は、動画を自動再生しないようにする
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
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


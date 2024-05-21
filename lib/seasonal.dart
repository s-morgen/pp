import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class seasonalscreen  extends StatelessWidget {
  const seasonalscreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      //..loadRequest(Uri.parse('https://s2.kingtime.jp/independent/recorder2/personal/')) //初めに開くページの設定
    ..loadRequest(Uri.parse('https://www.itoyokado.co.jp/voice/index.html')) //ポッポHP
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
    return  Scaffold(
        appBar: AppBar(
        title: Text('iii'),
      ),
      body:  SafeArea(
        child:Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: IconButton(
                    onPressed: () {
                      //戻る動作
                      controller.goBack();
                    },
                    //アイコン設定
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_box/Pages/my_page.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/utils/dimensions.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Inquiry extends StatefulWidget {
  @override
  _InquiryState createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {
  final Completer _controller = Completer();

  var connectionStatus;

  int position = 1;
  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  // インターネット接続チェック
  Future check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connectionStatus = true;
      }
    } on SocketException catch (_) {
      connectionStatus = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return await MyDrawer.movePage(context, MyPage());
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('お問い合わせ'),
        body: connectionStatus == true
            ? IndexedStack(
                index: position,
                children: [
                  WebView(
                    initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSevDDyPRzgpgAYOHduZkS55qxsC8c87vDjw_YGK12vq8xGk1w/viewform',
                    javascriptMode: JavascriptMode.unrestricted,
                    // JavaScriptを有効化
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    key: key,
                    onPageFinished: doneLoading,
                    // indexを０にしてWebViewを表示
                    onPageStarted: startLoading, // indexを1にしてプログレスインジケーターを表示
                  ),
                  // プログレスインジケーターを表示
                  Container(
                    child: Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.blue),
                    ),
                  ),
                ],
              )
            // インターネットに接続されていない場合の処理
            : SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 120,
                          bottom: 20,
                        ),
                        child: Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: Text(
                          'インターネットに接続されていません',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context, 4),
      ),
    );
  }
}

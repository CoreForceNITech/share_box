import 'package:flutter/material.dart';
import 'package:share_box/Pages/home.dart';
import 'package:share_box/Pages/main.dart';
import 'package:share_box/my_class/my_drawer.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return await MyDrawer.movePage(context, Home());
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('マイページ'),
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'ログアウト',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(context, const MyHomePage(title: 'LoginPage!'));
                  },
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
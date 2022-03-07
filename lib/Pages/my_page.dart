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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      Card(
                        child: ListTile(
                          title: const Text('閲覧履歴'),
                          trailing: const Icon(Icons.arrow_forward_ios_sharp),
                          onTap: () {
                            //MyDrawer.movePage(context, IntroductNewBooks());
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('出品した商品'),
                          trailing: const Icon(Icons.arrow_forward_ios_sharp),
                          onTap: () {
                            //MyDrawer.movePage(context, IntroductNewBooks());
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: const Text('アカウント情報'),
                          trailing: const Icon(Icons.arrow_forward_ios_sharp),
                          onTap: () {
                            //MyDrawer.movePage(context, IntroductNewBooks());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  child: const Text(
                    '利用規約/プライバシーポリシー',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(
                        context, const MyHomePage(title: 'LoginPage!'));
                  },
                ),
                TextButton(
                  child: const Text(
                    'お問い合せ',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(
                        context, const MyHomePage(title: 'LoginPage!'));
                  },
                ),
                TextButton(
                  child: const Text(
                    'ログアウト',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    MyDrawer.movePage(
                        context, const MyHomePage(title: 'LoginPage!'));
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

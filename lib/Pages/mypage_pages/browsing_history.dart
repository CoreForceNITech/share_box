import 'package:flutter/material.dart';
import 'package:share_box/Pages/my_page.dart';
import 'package:share_box/my_class/my_drawer.dart';

class BrowsingHistory extends StatefulWidget {
  @override
  _BrowsingHistoryState createState() => _BrowsingHistoryState();
}

class _BrowsingHistoryState extends State<BrowsingHistory> {
  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return await MyDrawer.movePage(context, MyPage());
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('閲覧履歴'),
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  'まだ閲覧していません。',
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

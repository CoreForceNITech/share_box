import 'package:flutter/material.dart';
import 'package:share_box/Pages/home.dart';
import 'package:share_box/my_class/my_drawer.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {

  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return await MyDrawer.movePage(context, Home());
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('お知らせ'),
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  '現在お知らせはありません。',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyDrawer.myBottomNavigationBar(context, 3),
      ),
    );
  }
}
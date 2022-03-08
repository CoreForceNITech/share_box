import 'package:flutter/material.dart';
import 'package:share_box/Pages/home.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/utils/dimensions.dart';

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
          padding: MyDrawer.paddingSize(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  '現在お知らせはありません。',
                  style: TextStyle(
                    fontSize: Dimensions.font14,
                  ),
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
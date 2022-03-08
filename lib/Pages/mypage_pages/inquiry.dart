import 'package:flutter/material.dart';
import 'package:share_box/Pages/my_page.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/utils/dimensions.dart';

class Inquiry extends StatefulWidget {
  @override
  _InquiryState createState() => _InquiryState();
}

class _InquiryState extends State<Inquiry> {
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
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: MyDrawer.paddingSize(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  '現在お問い合わせできません。',
                  style: TextStyle(
                    fontSize: Dimensions.font14,
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

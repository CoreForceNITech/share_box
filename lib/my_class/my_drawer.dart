import 'package:flutter/material.dart';
import 'package:share_box/my_class/my_share.dart';

class MyDrawer{
  /*
  画面遷移するメソッド(片瀬)
  使い方:
  contextはbuildのcontextをそのまま入れる
  pagesは遷移先のページを入れる。
  ※Androidやiosの遷移をそのまま使っているので、アニメーションを変更したい場合はPageRouteBuilderを使ったページ遷移メソッドを作ること。
   */
  static Future movePage(BuildContext context, var pages) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pages,
      ),
    );
  }

  /*
  AppBarの形式を統一するメソッド(片瀬)
  AppBar()を戻り値にしてさえいれば、ご自由に編集してください
  使い方:
  AppBarに表示したい文字をtextとして与える。
  *ログイン後とログイン前でAppBarを分ける場合は、こちらをログイン前のAppBarとしてください。
   */
  static PreferredSizeWidget? myAppBar(String text){
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      //共有(share)のボタン
      actions: [
        MyShare.myShare(),
      ],
    );
  }

}
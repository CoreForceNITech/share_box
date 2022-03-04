import 'package:flutter/material.dart';

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

}
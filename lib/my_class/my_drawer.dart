import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:share_box/Pages/home.dart';
import 'package:share_box/my_class/my_share.dart';

class MyDrawer {
  /*
  自動ログインパスワード保管用(片瀬)
  使い方:
  storageを使いたいところに置く。
   */
  static const storage = FlutterSecureStorage();

  /*
  画面遷移するメソッド(片瀬)
  使い方:
  contextはbuildのcontextをそのまま入れる。
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
  static PreferredSizeWidget? myAppBar(String text) {
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

  /*
  BottomBar(片瀬)
  使い方:
  contextはbuildのcontextをそのまま入れる。
  _selectedIndexはそのページのIndexを入れる。
  Index:
  Home:0
  欲しいものリスト:1
  出品:2
  お知らせ:3
  マイページ:4
   */
  static Widget myBottomNavigationBar(
      BuildContext context, int _selectedIndex) {
    int _initIndex = _selectedIndex;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: '欲しいものリスト',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          label: '出品',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active),
          label: 'お知らせ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'マイページ',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        _selectedIndex = index;
        if (_selectedIndex == 0 && _initIndex != 0) {
          movePage(context, Home());
        }
        if (_selectedIndex == 1 && _initIndex != 1) {
          //movePage(context, InformFromOperation());
        }
        if (_selectedIndex == 2 && _initIndex != 2) {
          //movePage(context, SearchBookCollection());
        }
        if (_selectedIndex == 3 && _initIndex != 3) {
          //movePage(context, Setting());
        }
        if (_selectedIndex == 4 && _initIndex != 4) {
          //movePage(context, Setting());
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:share_box/Pages/my_page.dart';
import 'package:share_box/my_class/my_drawer.dart';

class ExhibitedProducts extends StatefulWidget {
  @override
  _ExhibitedProductsState createState() => _ExhibitedProductsState();
}

class _ExhibitedProductsState extends State<ExhibitedProducts> {
  @override
  Widget build(BuildContext context) {
    //web,Android上の戻るボタン
    return WillPopScope(
      onWillPop: () async {
        //押したら反応するコード
        return await MyDrawer.movePage(context, MyPage());
      },
      child: Scaffold(
        appBar: MyDrawer.myAppBar('出品した商品'),
        body: Container(
          width: double.infinity,
          //画面端の余白
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  'まだ出品していません。',
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

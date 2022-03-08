import 'package:flutter/material.dart';
import 'package:share_box/Pages/my_page.dart';
import 'package:share_box/my_class/my_drawer.dart';
import 'package:share_box/utils/dimensions.dart';

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
          padding: MyDrawer.paddingSize(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'まだ出品していません。',
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
